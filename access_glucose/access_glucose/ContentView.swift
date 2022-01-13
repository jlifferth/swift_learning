//
//  ContentView.swift
//  access_glucose
//
//  Created by Jonathan Lifferth on 1/3/22.
//


import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var healthStore: HealthStore?
    @State private var glucoseValues: [glucoseValue] = [glucoseValue]()
    @State private var glucoseArray: [Int] = [Int]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics( statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let value = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let glucoseValue = glucoseValue(value: Int(value ?? 0), date: statistics.startDate)
            glucoseValues.append(glucoseValue)
        }
        
        for value in glucoseValues {
            print(value.value)
            glucoseArray.append(value.value)
        }
        print(glucoseArray)
        
        let glucoseString = arrayToString(floatArray: glucoseArray)
        let prediction = getPrediction(glucoseString: glucoseString)
        
        print(prediction)
        
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 244/255, green: 94/255, blue: 97/255, opacity: 1.0), Color(red: 253/255, green: 97/255, blue: 153/255, opacity: 1.0)]), startPoint: .top, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hello, world!")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.red)
            
                Button("Click to grant HealthKit Access and view glucose data") {
                    if let healthStore = healthStore {
                        healthStore.requestAuthorization { success in
                            if success {
                                healthStore.calculateSteps  { statisticsCollection in
                                    if let statisticsCollection = statisticsCollection {
                                        // update the UI
                                        print(statisticsCollection)
                                        updateUIFromStatistics(statisticsCollection: statisticsCollection)
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                .foregroundColor(Color.white)
                .background(Color.red)
                .padding()
                
                List(glucoseValues, id: \.id) { glucoseValue in
                    VStack(alignment: .leading) {
                        Text("\(glucoseValue.value)")
                        Text(glucoseValue.date, style: .date)
                            .opacity(0.5)

                    }
                    .listRowBackground(Color.red)
                    .navigationTitle("Steps")
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  acces_steps
//
//  Created by Jonathan Lifferth on 1/3/22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics( statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(Color.green)
        
            Button("Click to grant to the uh the store uh the app idk uh plz HealthKit Access") {
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
            .background(Color.green)
            .padding()
            
            List(steps, id: \.id) { step in
                VStack(alignment: .leading) {
                    Text("\(step.count)")
                    Text(step.date, style: .date)
                        .opacity(0.5)

                }
            }
            .navigationTitle("Steps")
            
        }
        

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

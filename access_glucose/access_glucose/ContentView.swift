//
//  ContentView.swift
//  access_glucose
//
//  Created by Jonathan Lifferth on 1/3/22.
//

import SwiftUI
import HealthKit

func fetchHealthData() -> Void {
    let healthStore = HKHealthStore()
    
    if HKHealthStore.isHealthDataAvailable() {
        let readData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!])
        healthStore.requestAuthorization(toShare: [], read: readData) { (success, error) in
            if success {
                let calendar = NSCalendar.current

                var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: NSDate() as Date)

                let offset = (7 + anchorComponents.weekday! - 2) % 7

                anchorComponents.day! -= offset
                anchorComponents.hour = 2
                
                guard let anchorDate = Calendar.current.date(from: anchorComponents) else {
                    fatalError("*** unable to create a valid date from the given components ***")
                }
                
                let interval = NSDateComponents()
                interval.minute = 30
                
                let endDate = Date()
                
                
            } else {
                        print("Authorization failed")
                }
        }

    } else {
        print("No HealthKit data available")
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: fetchHealthData) {
                Text("Fetch data")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 150)
                .background(Color.black)
                .cornerRadius(40)
                .border(Color.black)
                .cornerRadius(40)
                .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  HTTPRequest
//
//  Created by Jonathan Lifferth on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
    
        VStack {
            
            var prediction:String?
            
            Button(action: {
                
                print("Button pressed")
                let glucoseString = arrayToString(floatArray: glucoseData)
                let prediction = getPrediction(glucoseString: glucoseString)
                print(prediction)
                Text(prediction)
            
            }){
                Text("Button")
            }
        
        
        Text("Hello, world!")
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

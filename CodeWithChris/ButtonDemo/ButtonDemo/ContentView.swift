//
//  ContentView.swift
//  ButtonDemo
//
//  Created by Jonathan Lifferth on 1/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            // Button instance with closure
            Button("Click Me", action: {
                
                print("Hello World")
            })
            
            // Button instance with trailing closure
            Button("Click Me") {
            
            print("Hello World")
                
            }
            
            // button instance with label view
            Button {
                print("Hello world")
            } label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
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

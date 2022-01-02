//
//  ContentView.swift
//  testProject
//
//  Created by Jonathan Lifferth on 1/1/22.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background()
    }
    
    // Methods
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPod touch (7th generation)")
            .preferredColorScheme(.dark)
            ContentView()
                .previewDevice("iPod touch (7th generation)")
                .preferredColorScheme(.dark)
        }
    }
}

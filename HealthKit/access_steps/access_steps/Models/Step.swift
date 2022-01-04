//
//  Step.swift
//  access_steps
//
//  Created by Jonathan Lifferth on 1/3/22.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

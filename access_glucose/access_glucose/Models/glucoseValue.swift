//
//  Step.swift
//  access_glucose
//
//  Created by Jonathan Lifferth on 1/12/22.
//

import Foundation

struct glucoseValue: Identifiable {
    let id = UUID()
    let value: Int
    let date: Date
}

//
//  Functions.swift
//  access_glucose
//
//  Created by Jonathan Lifferth on 1/12/22.
//

import Foundation
import Just

func arrayToString(floatArray: [Int]) -> String {
    let stringArray = floatArray.map { String($0) }
    let string = stringArray.joined(separator: ",")
    return string
}

func getPrediction(glucoseString: String) -> String {
    let rootAddress: String = "http://10.3.75.94:5000/"
    let glucoseRequest: String = "predict?glucose_array="
    let glucoseString: String = glucoseString
    let url = URL(string: rootAddress + glucoseRequest + glucoseString)!
    
    //  A simple get request
    let request = Just.get(url)
    let glucoseResponse = request.text!
//    print(glucoseResponse)
    print("request served")
    
    return glucoseResponse
}

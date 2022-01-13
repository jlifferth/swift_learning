//
//  Model.swift
//  HTTPRequest
//
//  Created by Jonathan Lifferth on 1/10/22.
//

import Foundation
import Just

let glucoseData: [Double] = [113, 114, 116, 117, 117, 118, 118, 118, 118, 118, 119, 119, 119, 119, 119, 119, 117, 115, 119, 119, 118, 117, 116, 117, 118, 118, 119, 120, 120, 121, 122, 122, 122, 122, 122, 121, 121, 121, 121, 121, 121, 122, 125, 125, 122, 121, 121, 120, 120, 121, 121, 121, 121, 121, 121, 123, 124, 125, 124, 124, 123, 124, 124, 126, 126, 126, 125, 126, 126, 125, 124, 124, 125, 122, 121, 120, 121, 122, 122, 117, 116, 114, 112, 113, 115, 117, 119, 119, 117, 117, 115, 113, 115, 119, 126, 131, 136, 136, 131, 123, 115, 109, 105, 104, 104, 102, 101]

func arrayToString(floatArray: [Double]) -> String {
    let stringArray = floatArray.map { String($0) }
    let string = stringArray.joined(separator: ",")
    return string
}

func getPrediction(glucoseString: String) -> String {
    let rootAddress: String = "http://10.3.75.103:5000/"
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

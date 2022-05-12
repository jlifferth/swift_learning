import UIKit
import Foundation

let rootAddress: String = "http://nudgeapiv5-env.eba-ryvkdpxn.us-east-1.elasticbeanstalk.com"
let glucoseRequest: String = "/predict?glucose_array="

var glucoseString3: String = "185.4,178.2,169.2,176.4,172.8,169.2,165.6,160.2,156.6,151.2,147.6,144.0,142.2,142.2,140.4,140.4,138.6,135.0,135.0"


let url = URL(string: rootAddress + glucoseRequest + glucoseString3)!

print(url)

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data {
        let response = String(decoding: data, as: UTF8.self)
        print(response)
        print(type(of:response))

    } else if let error = error {
        print("HTTP Request Failed \(error)")
    }
}

task.resume()


//let glucoseData: [Double] = [113, 114, 116, 117, 117, 118, 118, 118, 118, 118, 119, 119, 119, 119, 119, 119, 117, 115, 119, 119, 118, 117, 116, 117, 118, 118, 119, 120, 120, 121, 122, 122, 122, 122, 122, 121, 121, 121, 121, 121, 121, 122, 125, 125, 122, 121, 121, 120, 120, 121, 121, 121, 121, 121, 121, 123, 124, 125, 124, 124, 123, 124, 124, 126, 126, 126, 125, 126, 126, 125, 124, 124, 125, 122, 121, 120, 121, 122, 122, 117, 116, 114, 112, 113, 115, 117, 119, 119, 117, 117, 115, 113, 115, 119, 126, 131, 136, 136, 131, 123, 115, 109, 105, 104, 104, 102, 101]
//
//
//func arrayToString(floatArray: [Double]) -> String {
//    let stringArray = floatArray.map { String($0) }
//    let string = stringArray.joined(separator: ",")
//    return string
//}
//
//func callPrediction(glucoseString: String) -> String {
//    let rootAddress: String = "http://10.3.75.103:5000/"
//    let glucoseRequest: String = "predict?glucose_array="
//    let glucoseString: String = glucoseString
//    let url = URL(string: rootAddress + glucoseRequest + glucoseString)!
//
//   var response:String
//
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            let response = String(decoding: data, as: UTF8.self)
//            print("Prediction received: ")
//            print(response)
////            print(type(of:response))
//
//        } else if let error = error {
//            print("HTTP Request Failed \(error)")
//        }
//    }
//    task.resume()
//
//    return response
//}
//
//
//callPrediction(glucoseString: arrayToString(floatArray: glucoseData))
//
//
//let glucoseString2: String = arrayToString(floatArray: glucoseData)
//print(glucoseString2)


var glucoseString0: String = "185.4,178.2,169.2,176.4,172.8,169.2,165.6,160.2,156.6,151.2,147.6,144.0,142.2,142.2,140.4,140.4,138.6,135.0,135.0,135.0,136.8,140.4,144.0,147.6,149.4,149.4,149.4,147.6,144.0,142.2,140.4,136.8,135.0,133.2,135.0,136.8,140.4,144.0,149.4,153.0,156.6,156.6,158.4,158.4,158.4,160.2,163.8,167.4,171.0,176.4,180.0,185.4,187.2,190.8,194.4,194.4,194.4,194.4,192.6,190.8,187.2,183.6,183.6,180.0,178.2,180.0,185.4,192.6,199.8,207.0,214.2,216.0,219.6,219.6,217.8,216.0,214.2,210.6,207.0,205.2,201.6,198.0,196.2,194.4,190.8,187.2,183.6,180.0,176.4,174.6,172.8,171.0,171.0,172.8,176.4,178.2,180.0,183.6,183.6,183.6"

var glucoseString1: String = "113,114,116,117,117,118,118,118,118,118,119,119,119,119,119,119,117,115,119,119,118,117,116,117,118,118,119,120,120,121,122,122,122,122,122,121,121,121,121,121,121,122,125,125,122,121,121,120,120,121,121,121,121,121,121,123,124,125,124,124,123,124,124,126,126,126,125,126,126,125,124,124,125,122,121,120,121,122,122,117,116,114,112,113,115,117,119,119,117,117,115,113,115,119,126,131,136,136,131,123,115,109,105,104,104,102,101"


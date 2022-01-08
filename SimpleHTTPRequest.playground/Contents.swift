import UIKit
import Foundation

let rootAddress: String = "http://192.168.1.247:5000/"
let glucoseRequest: String = "predict?glucose_array=185.4,178.2,169.2,176.4,172.8,169.2,165.6,160.2,156.6,151.2,147.6,144.0,142.2,142.2,140.4,140.4,138.6,135.0,135.0,135.0,136.8,140.4,144.0,147.6,149.4,149.4,149.4,147.6,144.0,142.2,140.4,136.8,135.0,133.2,135.0,136.8,140.4,144.0,149.4,153.0,156.6,156.6,158.4,158.4,158.4,160.2,163.8,167.4,171.0,176.4,180.0,185.4,187.2,190.8,194.4,194.4,194.4,194.4,192.6,190.8,187.2,183.6,183.6,180.0,178.2,180.0,185.4,192.6,199.8,207.0,214.2,216.0,219.6,219.6,217.8,216.0,214.2,210.6,207.0,205.2,201.6,198.0,196.2,194.4,190.8,187.2,183.6,180.0,176.4,174.6,172.8,171.0,171.0,172.8,176.4,178.2,180.0,183.6,183.6,183.6"

//print(rootAddress + glucoseRequest)

let url = URL(string: rootAddress + glucoseRequest)!

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

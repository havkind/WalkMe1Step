//
//  NetworkManager.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import Foundation

enum HTTPMethod: String {
    case POST = "POST"
}

struct NetworkManager{
    static func sendRequest(method: HTTPMethod, url: URL, body: Data?){
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        let task = URLSession.shared.dataTask(with: request){data, response, error  in
            
        }
        task.resume()
    }
}

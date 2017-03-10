//
//  NetworkService.swift
//  SnapsureSDK
//
//  Created by Artem Novichkov on 10/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

import Foundation

final class NetworkService {
    
    let session: URLSession
    let baseURLString = "https://node-2.snapsure.de/"
    let token = "developer-a3a2e467-999e-4d57-abc6-b0ed90f1c48f"
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }
    
    func sendRequest1() {
        let url = URL(string: "\(baseURLString)images/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Headers
        
        addToken(for: &request)
        request.addValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    func sendRequest2() {
        let url = URL(string: "\(baseURLString)3/2")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Headers
        
        addToken(for: &request)
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    func addToken(for request: inout URLRequest) {
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
}

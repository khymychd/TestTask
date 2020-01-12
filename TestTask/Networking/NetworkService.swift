//
//  NetworkService.swift
//  TestTask
//
//  Created by KillerBe on 11.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import Foundation

class NetworkService {
   
    func request (urlString:String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        let task = createDataTask(request, completion: completion)
        task.resume()
    }
    
   
    
    private func createDataTask(_ request: URLRequest,completion: @escaping (Data?, Error?) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        
    }
}

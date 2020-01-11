//
//  DataFetcherService.swift
//  TestTask
//
//  Created by KillerBe on 11.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import Foundation

class DataFetcherService {
   
    var networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
        func fetchTrending (urlString:String, completion: @escaping (TrendingJSONModel?) -> Void) {
            networkService.request(urlString: urlString) { (data, error) in
                guard let data = data else {return}
                let response = try? JSONDecoder().decode(TrendingJSONModel.self, from: data)
                completion(response)
            }
            
        }
        
        
    }


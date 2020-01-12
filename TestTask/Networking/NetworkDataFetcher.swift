//
//  NetworkDataFetcher.swift
//  TestTask
//
//  Created by KillerBe on 12.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    var networkservice: NetworkService
    
    init(networkservice: NetworkService = NetworkService() ) {
        self.networkservice = networkservice
    }
    // This method parse JSON data to model
   func decodeJSONData <T: Decodable> (type: T.Type , from: Data?) -> T? {
       let decoder = JSONDecoder()
        guard let data = from else {return nil}
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
            
        }catch let error{
            print(error.localizedDescription)
            return nil
        }
        
    }
            
            
}
        
    
    


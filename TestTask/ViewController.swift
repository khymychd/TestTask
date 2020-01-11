//
//  ViewController.swift
//  TestTask
//
//  Created by KillerBe on 11.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataFetchingService = DataFetcherService()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dataFetchingService.fetchTrending(urlString: "https://demo0040494.mockable.io/api/v1/trending") { (result) in
            print (result)
        }
    }


}


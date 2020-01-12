//
//  ViewController.swift
//  TestTask
//
//  Created by KillerBe on 11.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import UIKit
import WebKit

var counter:Int = 0


class ViewController: UIViewController , WKNavigationDelegate{
    
    var networkDataFtecher =  NetworkDataFetcher()
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getObject { (object) in
            self.chekObject(object: object)
        }
        
    }
    

    func chekObject (object: ObjectJSONModel) {
        guard let type = object.type else {return}
       
        if type == TypeOfObject.text.rawValue {
            if let contentText = object.contents {
                   print(contentText)
                    resultLabel.isHidden = false
                    resultLabel.text = contentText
                    webView.isHidden = true
                    webView.stopLoading()
            }
        } else {
            
                if let urlString = object.url {
                    guard let url = URL(string: urlString) else {return}
                    webView.isHidden = false
                    webView.load(URLRequest(url: url))
                    print(url)
                    resultLabel.isHidden = true
                }
        }
        
        
           
          
        
    }
    
    @IBAction func Next(_ sender: UIButton) {
        counter += 1
        getObject { (object) in
            self.chekObject(object: object)
        }
        print(counter)
    }
}


extension ViewController {
    
    func getObject (completion: @escaping (ObjectJSONModel) -> Void) {
        getTrendingObjects { [weak self] (trendingArray) in
            if counter >= trendingArray.count {
                counter = 0
            }
            guard let self = self else {return}
            guard let id = trendingArray[counter].id else {return}
            let url = "https://demo0040494.mockable.io/api/v1/object/" + String(id)
            self.networkDataFtecher.networkservice.request(urlString: url) { (data, error) in
                let json = self.networkDataFtecher.decodeJSONData(type: ObjectJSONModel.self, from: data)
                guard let object = json else {return}
                DispatchQueue.main.async {
                    completion(object)
                }
            }
        }
    }
    
    
    func getTrendingObjects (completion: @escaping ([TrendingJSONModel]) -> Void ) {
        let url = "https://demo0040494.mockable.io/api/v1/trending"
        self.networkDataFtecher.networkservice.request(urlString: url ) { (data, error) in
            let objects = self.networkDataFtecher.decodeJSONData(type: [TrendingJSONModel].self, from: data)
            guard let objectArray = objects else {return}
            DispatchQueue.main.async {
                completion(objectArray)
            }
            
        }
    }
}

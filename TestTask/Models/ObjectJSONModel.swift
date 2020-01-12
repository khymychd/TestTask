//
//  ObjectJSONModel.swift
//  TestTask
//
//  Created by KillerBe on 11.01.2020.
//  Copyright © 2020 Khymychcrew. All rights reserved.
//

import Foundation

enum TypeOfObject: String{
    case text = "text"
    case webView = "webview"
}

struct ObjectJSONModel:Decodable{
    var type:String?
    var contents:String?
    var url:String?
}

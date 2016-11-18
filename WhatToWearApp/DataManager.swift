//
//  DataManager.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 9/6/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager: NSObject {
    
    let apiURL = "https://whattowearapi.herokuapp.com/clothings/"
    var clothingIdNumber = String()
    
    func getClothing() {
        Alamofire.request(.GET, apiURL+clothingIdNumber+".json")
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                    print(json["category"])
                }
        }
    }
    
    func getTops() {
        print("getting all the tops")
    }
    
    func getBottoms() {
        print("getting all the bottoms")
    }
    
    func getOnePieces() {
        print("getting all the onepieces")
    }
    
    func postClothing(_ clothing: Clothing) {
        var postParams = [String: [String: AnyObject]]()
        if let brand = clothing.brand, let color = clothing.color, let seasons = clothing.seasons, let workApp = clothing.workAppropriate, let layerable = clothing.layerable {
            postParams = ["clothing": ["brand": brand as AnyObject, "color": color as AnyObject, "seasons": seasons as AnyObject, "workAppropriate": workApp as AnyObject, "layerable": layerable as AnyObject]]
            Alamofire.request(.POST, apiURL, parameters: postParams, encoding: .json)
                .responseString { response in
                    print("here is the request body")
                    print(NSString(data: (response.request?.httpBody!)!, encoding: String.Encoding.utf8)!)
                    print(response.response)
                    print(response.data)
                    print(response.result)
                    print(response.result.error)
                    
                    if let value = response.result.value {
                        let json = JSON(value)
                        print("POST response: \(json)")
                        print(json["category"])
                    }
            }
        }
    }
    

}

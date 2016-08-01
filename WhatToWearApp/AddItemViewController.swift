//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/29/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddItemViewController: UIViewController {
    
    let clothingType = UIPickerView()
    let brandField = UITextField()
    let color = UITextField()
    let workAppropriate = UISwitch()
    let clothingIdNumber : Int = 2
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
//        
//        Alamofire.request(.GET, "https://whattowearapi.herokuapp.com/clothings/\(clothingIdNumber).json")
//            .responseJSON { response in
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    print("JSON: \(json)")
//                    print(json["category"])
//                }
//        }
//        
        let postParams: [String: AnyObject] = [
            "clothing" : [
                "brand":"Old Navy",
                "category":"top",
                "color":"green",
                "seasons":"yearlong",
                "style":"button-down",
                "work_approp":false ]]
        Alamofire.request(.POST, "https://whattowearapi.herokuapp.com/clothings.json", parameters: postParams, encoding: .JSON)
            .responseJSON { response in
                print("here is the request body")
                print(NSString(data: (response.request?.HTTPBody!)!, encoding: NSUTF8StringEncoding)!)
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
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
//    func makeApiRequest() {
//        var responseDict: NSDictionary = JSONSerialization.JSONObjectWithData(responseData,options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
//    }
    
//    func post_request() {
//        let url_to_request = "https://whattowearapi.herokuapp.com/clothings"
//        let url:NSURL = NSURL(string: url_to_request)!
//        let session = URLSession.shared()
//        
//        let request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "GET"
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        
//        let paramString = "data=Hello"
//        request.httpBody = paramString.data(using: String.Encoding.utf8)
//        
//        let task = session.dataTask(with: request as URLRequest) {
//            (data, response, error) in
//            guard let _:NSData = data, let _:URLResponse = response  where error == nil else {
//                print("error")
//                return
//            }
//            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("*******dataString is ")
//            print(dataString)
//        }
//        task.resume()
//    }
    
    
    
    
}

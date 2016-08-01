//
//  AddItemViewController.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/29/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    let clothingType = UIPickerView()
    let brandField = UITextField()
    let color = UITextField()
    let workAppropriate = UISwitch()
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
//    func makeApiRequest() {
//        var responseDict: NSDictionary = JSONSerialization.JSONObjectWithData(responseData,options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
//    }
    
    func post_request() {
        let url_to_request = "http://localhost:3000/Clothing"
        let url:NSURL = NSURL(string: url_to_request)!
        let session = URLSession.shared()
        
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            guard let _:NSData = data, let _:URLResponse = response  where error == nil else {
                print("error")
                return
            }
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("*******dataString is ")
            print(dataString)
        }
        task.resume()
    }
    
}

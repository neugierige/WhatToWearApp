//
//  Clothing.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/1/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import Foundation
import Firebase

class Clothing {
    
//    var rootRef = FIRDatabase.database().reference()
    
    var item: [String:String]? = [:]
    
    var items: Array<[String:String]> = [
        ["type":"top", "style": "colarless", "color":"white", "brand":"Ann Taylor"],
        ["type":"top", "style": "long sleeve", "color":"black", "brand":"Uniqlo"],
        ["type":"top", "style": "T", "color":"white", "brand":"GAP"],
        ["type":"top", "style": "linen button-down", "color":"orange", "brand":"Uniqlo"],
        ["type":"top", "style": "tank", "color":"black", "brand":"I don't remember"],
        ["type":"top", "style": "silk button-down", "color":"torquoise", "brand":"GAP"],
        ["type":"bottom", "style": "jeans", "color":"grey", "brand":"Forever 21"],
        ["type":"bottom", "style": "pants", "color":"black", "brand":"Uniqlo"],
        ["type":"bottom", "style": "shorts", "color":"navy", "brand":"GAP"],
        ["type":"bottom", "style": "skirt", "color":"navy", "brand":"J.Crew"]
    ]
    
    
    
    
    func getTops() -> Array<[String:String]> {
        
        var topsArray: Array<[String:String]> = []
        
        for item in items {
            if item["type"] == "top" {
                topsArray.append(item)
                //print("the top is a \(item["color"]) \(item["style"]) from \(item["brand"])")
            } else {
                //print("add some tops")
            }
        }
        return topsArray
    }
    
    func getBottoms() -> Array<[String:String]> {
        var bottomsArray: Array<[String:String]> = []
        for item in items {
            if item["type"] == "bottom" {
                bottomsArray.append(item)
                //print("the bottom is a \(item["color"]) \(item["style"]) from \(item["brand"])")
            } else {
                //print("add some bottoms")
            }
        }
        return bottomsArray
    }
    
}

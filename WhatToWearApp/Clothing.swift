//
//  Clothing.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/1/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import Foundation

class Clothing {
    
//    let brand, color: String?
//    let workAppropriate, layerable: Bool?
//    
//    init(brand:String, color: String, workAppropriate: Bool, layerable: Bool) {
//        self.brand = brand
//        self.color = color
//        self.workAppropriate = workAppropriate
//        self.layerable = layerable
//    }
//    
//    enum ClothingCategory {
//        case Top
//        case Bottom
//        case OnePiece
//        case Shoes
//    }
//    
//    enum Season {
//        case Spring
//        case Summer
//        case Fall
//        case Winter
//        case Yearlong
//    }
    
    
    var item: [String:String]? = [:]
    
    
    //********** SAMPLE DATA **********//
    var items = [
        ["type":"top", "style": "colarless", "color":"white", "brand":"Ann Taylor"],
        ["type":"top", "style": "long sleeve", "color":"black", "brand":"Uniqlo"],
        ["type":"top", "style": "T", "color":"white", "brand":"GAP"],
        ["type":"top", "style": "linen button-down", "color":"orange", "brand":"Uniqlo"],
        ["type":"top", "style": "tank", "color":"black", "brand":"I don't remember"],
        ["type":"top", "style": "silk button-down", "color":"torquoise", "brand":"GAP"],
        ["type":"bottom", "style": "jeans", "color":"grey", "brand":"Forever 21"],
        ["type":"bottom", "style": "pants", "color":"black", "brand":"Uniqlo"],
        ["type":"bottom", "style": "shorts", "color":"navy", "brand":"GAP"],
        ["type":"bottom", "style": "skirt", "color":"navy", "brand":"J.Crew"],
        ["type":"onepiece", "style": "dress", "color":"black & navy", "brand":"GAP"],
        ["type":"onepiece", "style": "dress", "color":"black", "brand":"GAP"],
        ["type":"onepiece", "style": "dress", "color":"mint", "brand":"J.Crew"],
        ["type":"onepiece", "style": "dress", "color":"navy", "brand":"Uniqlo"]
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
            }
        }
        return bottomsArray
    }
    
    func getOnePiece() -> Array<[String:String]> {
        var onepieceArray: Array<[String:String]> = []
        for item in items {
            if item["type"] == "onepiece" {
                onepieceArray.append(item)
            }
        }
        return onepieceArray
    }
    
}

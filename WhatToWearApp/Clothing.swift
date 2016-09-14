//
//  Clothing.swift
//  WhatToWearApp
//
//  Created by Luyuan Xing on 7/1/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import Foundation

struct Clothing {
    
    var brand, color, seasons: String?
    var workAppropriate, layerable: Bool?
    var type: ClothingType?
    
    init(brand:String?, color: String?, seasons: String?, type: String, workAppropriate: Bool?, layerable: Bool?) {
        self.type = ClothingType(rawValue: type)
        self.brand = brand
        self.color = color
        self.seasons = seasons
        self.workAppropriate = workAppropriate
        self.layerable = layerable
    }
    
    enum ClothingCategory {
        case Top
        case Bottom
        case OnePiece
        
        var types: [Clothing.ClothingType] {
            switch self {
            case .Top:
                return [.TShirt, .LongsleeveShirt, .Tank, .Buttondown, .Sweatshirt, .Hoodie]
            case .Bottom:
                return [.Jeans, .Shorts]
            case .OnePiece:
                return [.ShirtDress]
                
            }
        }
    }
    
    enum ClothingType: String {
        case TShirt = "TShirt"
        case LongsleeveShirt = "LongsleeveShirt"
        case Tank = "Tank"
        case Buttondown = "Buttondown"
        case Sweatshirt = "Sweatshirt"
        case Hoodie = "Hoodie"
        case Jeans = "Jeans"
        case Shorts = "Shorts"
        case ShirtDress = "ShirtDress"
    }
    
    
    enum Brand: String {
        case GAP = "GAP"
        
    }
    
    enum Season {
        case Spring
        case Summer
        case Fall
        case Winter
    }
    
    
    var item: [String:String]? = [:]
    
}

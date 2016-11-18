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
        case top
        case bottom
        case onePiece
        
        var types: [Clothing.ClothingType] {
            switch self {
            case .top:
                return [.TShirt, .LongsleeveShirt, .Tank, .Buttondown, .Sweatshirt, .Hoodie]
            case .bottom:
                return [.Jeans, .Shorts]
            case .onePiece:
                return [.ShirtDress]
                
            }
            
            let type = ClothingType(rawValue: "TShirt")
            
        }
    }
    
    enum ClothingType: String {
        case TShirt
        case LongsleeveShirt
        case Tank
        case Buttondown
        case Sweatshirt
        case Hoodie
        case Jeans
        case Shorts
        case ShirtDress
        
        var category: [] {
            
        }
    }
    
    
    enum Brand: String {
        case GAP = "GAP"
    }
    
    enum Season {
        case spring
        case summer
        case fall
        case winter
    }
    
    
    var item: [String:String]? = [:]
    
}

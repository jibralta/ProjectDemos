//
//  Product.swift
//  Ceramics
//
//  Created by Joy Umali on 4/3/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import Foundation

class Product {
    
    var name: String
    var description: String
    var price: Double
    var reviews: [String]?
    var productCategory: String
    var roomCategory: [String]
    var story: [String]
    
    init(name: String, description: String, price: Double, productCategory: String, roomCategory: [String], story: [String]) {
        
        self.name = name
        self.description = description
        self.price = price
        self.productCategory = productCategory
        self.roomCategory = roomCategory
        self.story = story

    }
    
    
    //create struct for dictionary keys
    
    struct Keys {
        static let name = "name"
        static let description = "description"
        static let price = "price"
        static let reviews = "reviews"
        static let productCategory = "productCategory"
        static let roomCategory = "roomCategory"
        static let story = "story"
    }
}








//
//  Book.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

class Book {

    // Mark: Properties
    var id: Int
    var title: String
    var isbn: String
    var price: String
    var author: String
    
    // Mark: Initialisers
    init? (_ dict: [String: Any]) {
        
        guard
            let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let isbn = dict["isbn"] as? String,
            let author = dict["author"] as? String,
            let price = ParseUtil.formatPrice(dict: dict)
        
        else {
            print("error parsing JSON in Book initialiser")
            return nil
        }
        
        self.id = id
        self.title = title
        self.isbn = isbn
        self.price = price
        self.author = author
        
    }
    
}

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
    var price: Int
    var currencyCode: ISOCurrencyCode
    var author: String
    
    // Mark: Initialisers
    init? (_ dict: [String: Any]) {
        
        guard
            let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let isbn = dict["isbn"] as? String,
            let price = dict["price"] as? Int,
            let author = dict["author"] as? String
        
        else {
            print("error parsing JSON in Book initialiser")
            return nil
        }
        
        self.id = id
        self.title = title
        self.isbn = isbn
        self.price = price
        self.currencyCode = ISOCurrencyCode.EUR
        self.author = author
        
    }

}

// Enum to hold the ISO currency codes which can be found here: https://en.wikipedia.org/wiki/ISO_4217
enum ISOCurrencyCode {
    case EUR, GBP, USD
}

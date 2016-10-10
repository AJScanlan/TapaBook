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
    var currencyCode: ISOCurrencyCode // TODO: Enum
    var author: String
    
    // Mark: Initialisers
    init? (_ dict: [String: Any]) {
    
        // TODO: Parse JSON
        self.id = 1
        self.title = "Title"
        self.isbn = "ISBN"
        self.price = 1250
        self.currencyCode = ISOCurrencyCode.EUR
        self.author = "Author"
        
    }


}

// Enum to hold the ISO currency codes which can be found here: https://en.wikipedia.org/wiki/ISO_4217
enum ISOCurrencyCode {
    case EUR, GBP, USD
}

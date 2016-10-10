//
//  ParseUtil.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

import Foundation
class ParseUtil {

    // Formats the price from an int to a string (1999 -> "EUR: 19.99")
    static func formatPrice(dict: [String: Any]) -> String? {
        
        guard
            let price = dict["price"] as? Double,
            let currencyCode = dict["currencyCode"] as? String
            
            else {
                print("Error parsing price")
                return nil
        }
        
        return "\(currencyCode) \(price / 100)"
        
    }

}

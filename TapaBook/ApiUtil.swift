//
//  ApiUtil.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

import Foundation

class ApiUtil {
    
    static let ENDPOINT = "http://tpbookserver.herokuapp.com/"
    
    static func retrieveBookList(viewController: BookMasterVC) {
    
        guard let url = URL(string: ENDPOINT + "books") else {
            print("Error creating URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
    
        let task = session.dataTask(with: urlRequest) {
            
            (data, response, error) in
            
            guard error == nil else {
                print("Error retrieving books")
                print(error)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                
                guard let booksJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [[String: Any]] else {
                    print("Error serialising JSON")
                    return
                }
                
                var books = [Book]()
                
                for book in booksJSON {
                    
                    let newBook = Book(book)
                    
                    if let validBook = newBook {
                        books.append(validBook)
                    }
                }
                
                viewController.books = books
                
                return
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        
        }
    
        task.resume()
    
    }
    
    // TODO: Cancel if screen is navigated away from? i should just cache these
    static func retrieveBookDescription(viewController: BookDetailVC, book: Book) {
    
        guard let url = URL(string: ENDPOINT + "book/\(book.id)") else {
            print("Error creating URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            
            (data, response, error) in
            
            guard error == nil else {
                print("Error retrieving description")
                print(error)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data from \(urlRequest)")
                return
            }
            
            do {
                
                guard let bookJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    print("Error serialising JSON")
                    return
                }
                
                // Running on UI thread because of weird exception
                DispatchQueue.main.async {
                    viewController.outletDescription.text = bookJSON["description"] as? String
                    
                    if let description = bookJSON["description"] as? String {
                        viewController.outletDescription.text = description
                    } else {
                        viewController.outletDescription.text = "Error loading description"
                    }
                }
                
                return
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
        }
        
        task.resume()
    
    }

}

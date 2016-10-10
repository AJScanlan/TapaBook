//
//  BookDetailVCViewController.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

import UIKit

class BookDetailVC: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var outletTitle: UILabel!
    @IBOutlet weak var outletAuthor: UILabel!
    @IBOutlet weak var outletPrice: UILabel!
    @IBOutlet weak var outletISBN: UILabel!
    @IBOutlet weak var outletDescription: UITextView!
    
    var book: Book? {
        didSet {
            self.refresh()
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        outletDescription.text = "Loading..."
    }
    
    func refresh() {
        
        if let book = book {
            ApiUtil.retrieveBookDescription(viewController: self, book: book)
            
            outletTitle.text = book.title
            outletAuthor.text = book.author
            outletPrice.text = String(book.price)
            outletISBN.text = book.isbn
        }
    }
}

extension BookDetailVC: BookSelectionDelegate {
    func bookSelected(newBook: Book) {
        book = newBook
        outletDescription.text = "Loading..."
    }
}

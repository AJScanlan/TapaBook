//
//  BookTableVC.swift
//  TapaBook
//
//  Created by Alexander Scanlan on 10/10/2016.
//  Copyright © 2016 Alexander Scanlan. All rights reserved.
//

import UIKit

class BookTableVC: UITableViewController {
    
    // MARK: Properties
    var books = [Book]() {
        didSet{
            self.tableView.reloadData()
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        ApiUtil.retrieveBookList(viewController: self)
    }

    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "BookTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BookTableViewCell
        
        // Configure the cell...
        let book = books[indexPath.row]
        
        cell.outletAuthor.text = book.author
        cell.outletPrice.text = String(book.price)
        cell.outletTitle.text = book.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowBookDetail" {
            let bookDetailVC = segue.destination as! BookDetailVC
            
            if let selectedBookCell = sender as? BookTableViewCell {
            
                let indexPath = tableView.indexPath(for: selectedBookCell)!
                let selectedBook = books[indexPath.row]
                
                bookDetailVC.book = selectedBook
            }
        
        }
    
    }

}

//
//  ViewController.swift
//  BookLibrary
//
//  Created by Jace on 3/4/18.
//  Copyright © 2018 Jace. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var book:[Book]? = CoreDataHandler.fetchObject()
    
    @IBOutlet weak var bookTitleField: UITextField!
    @IBOutlet weak var isCheckedOutField: UITextField!
    @IBOutlet weak var pageCountField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func addBookButton(_ sender: Any) {
        
        let myBookTitle = bookTitleField.text
        let myIsCheckedOut = isCheckedOutField.text
        let myPageCount = Int(pageCountField.text!)
        
        
        
        if CoreDataHandler.saveObject(bookTitle: (myBookTitle)!, isCheckedOut: (myIsCheckedOut)!, pageCount: (myPageCount)!) {
            book = CoreDataHandler.fetchObject()
            
            
            for i in book! {
                print(i.bookTitle!)
            }
        }
        tableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (book?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell")! as? BookCell ?? BookCell()
        var thisBook:Book = (book![indexPath.row] as? Book)!
        cell.bookTitleLabel.text = thisBook.bookTitle
        cell.numberOfPagesLabel.text = "\(thisBook.pageCount)"
        cell.checkedOutLabel.text = thisBook.isCheckedOut
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let removeBook = UIContextualAction(style: .normal, title: "Delete") { (action, view, nil) in
            
            
            print(self.book?[indexPath.row])
            self.book?.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        let config = UISwipeActionsConfiguration(actions: [removeBook])
        
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
}


//
//  CoreDataHandler.swift
//  BookLibrary
//
//  Created by Jace on 3/5/18.
//  Copyright © 2018 Jace. All rights reserved.
//

import UIKit
import CoreData


class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
   class func saveObject(bookTitle: String, isCheckedOut: String, pageCount: Int) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Book", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
    
        manageObject.setValue(bookTitle, forKey: "bookTitle")
        manageObject.setValue(isCheckedOut, forKey: "isCheckedOut")
        manageObject.setValue(pageCount, forKey: "pageCount")
    
    do {
        try context.save()
        return true
    } catch {
        return false
    }
    
    }
    
    class func deleteObject() {
        let fetchRequest: NSFetchRequest = Book.fetchRequest()
        let context = getContext()
        let object = try! context.fetch(fetchRequest)
        context.delete(object)
    }
    

    class func fetchObject() -> [Book]? {
        let context = getContext()
        var book:[Book]? = nil
        do {
            book = try context.fetch(Book.fetchRequest())
            return book
        } catch {
            return book
        }
    }
    
}

//
//  CoreDataManager.swift
//  DreamJournal
//
//  Created by CUBS Customer on 10/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "DreamJournalModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
            fatalError("Error initializing core data: \(error)")
            }
        }
    }
}

//
//  DreamJournalApp.swift
//  DreamJournal
//
//  Created by CUBS Customer on 10/7/22.
//

import SwiftUI
import CoreData

@main
struct DreamJournalApp: App {
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}

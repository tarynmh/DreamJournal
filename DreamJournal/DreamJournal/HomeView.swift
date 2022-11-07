//
//  HomeView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 11/4/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Entry.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var allEntries: FetchedResults<Entry>
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [CustomColor.Navy, CustomColor.SkyPurple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Image("MoonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300, height: 300)
                VStack {
                    Divider()
                }
                
            }
//            .toolbar {
//                        Button(action: {}) {
//                            Image(systemName: "plus")
//                        }
//                    }
//            .navigationTitle("Sweet Dreams")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let persistedContainer = CoreDataManager.shared.persistentContainer
            HomeView().environment(\.managedObjectContext, persistedContainer.viewContext)
        }
        
    }
}

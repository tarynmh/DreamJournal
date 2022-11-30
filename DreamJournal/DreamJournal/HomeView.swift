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
    
    private func updateEntry(_ entry: Entry) {
            
            entry.isFave = !entry.isFave
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        private func deleteEntry(at offsets: IndexSet) {
            offsets.forEach { index in
                let entry = allEntries[index]
                viewContext.delete(entry)
                
                do {
                    try viewContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [CustomColor.Navy, CustomColor.SkyPurple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Divider()
                    Spacer()
                    List {
                        ForEach(allEntries) {
                            entry in HStack {
//                                Circle()
//                                    .frame(width: 15, height: 15)
//                                Spacer().frame(width: 20)
//                                Text(entry.title ?? "")
//                                Spacer()
//                                Image(systemName: entry.isFave ? "heart.fill": "heart")
//                                    .foregroundColor(.red)
                                DreamEntryView(card: Card(title: entry.title!, topic: entry.topic!, emotion: entry.emotion!, isFave: entry.isFave, date:entry.date!))
                            }
                        }
                    }
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
            HomeView()
        }
        
    }
}

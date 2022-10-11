//
//  ContentView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 10/7/22.
//

import SwiftUI
import CoreData

enum Category: String, Identifiable, CaseIterable {
    var id: UUID {
        return UUID()
    }
    
    case nightmare = "Nightmare"
    case neutral = "Neutral Dream"
    case good = "Good Dream"
}

extension Category {
    var title: String {
        switch self {
            case .nightmare:
                return "Nightmare"
            case .neutral:
                return "Neutral Dream"
            case .good:
                return "Good Dream"
        }
    }
}

struct ContentView: View {
    @State private var title: String = ""
    @State private var selectedCategory: Category = .neutral
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Entry.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allEntries: FetchedResults<Entry>

       private func saveDream() {

           do {
               let entry = Entry(context: viewContext)
               entry.title = title
               entry.emotion = selectedCategory.rawValue
               entry.date = Date()
               try viewContext.save()
           } catch {
               print(error.localizedDescription)
           }

       }
    
//    @FetchRequest(sortDescriptors: []) var dreams: FetchedResults<DreamJournalModel>
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Name your dream", text: $title)
                    .textFieldStyle(.roundedBorder)
                Picker("Dream Type", selection: $selectedCategory) {
                    ForEach(Category.allCases) {
                        category in Text(category.title).tag(category)
                    }
                }.pickerStyle(.segmented)
                
                Button("Save"){
//                    saveDream()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.indigo)
                .foregroundColor(Color.white)
                .clipShape(RoundedRectangle(cornerRadius:10, style:.continuous))
                
                List {
                    ForEach(allEntries) {
                        entry in Text(entry.title ?? "")
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sweet Dreams")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

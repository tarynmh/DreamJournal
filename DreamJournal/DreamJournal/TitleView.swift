//
//  TitleView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 11/28/22.
//

import SwiftUI
import CoreData

struct TitleView: View {
    
    @State private var goToNewEntry: Bool = false
   
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [CustomColor.Navy, CustomColor.SkyPurple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Divider()
                    Spacer()
                    NavigationLink(destination: NewEntryView(), isActive: $goToNewEntry)
                    {
                        Button(action: {
                            goToNewEntry = true
                        }){
                            Text("Record a Dream")
                        }
                    }
                    
                }
                Spacer()
                Image("MoonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300, height: 300)
                
            }
        }
        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TitleView()
        }
        
    }
}

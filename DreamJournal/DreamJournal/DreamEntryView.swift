//
//  DreamEntryView.swift
//  DreamJournal
//
//  Created by CUBS Customer on 11/28/22.
//

import SwiftUI

struct DreamEntryView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(CustomColor.LavenderBox)

            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text(card.topic)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
    }
}

struct DreamEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DreamEntryView(card: Card.example)
    }
}

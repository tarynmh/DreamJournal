//
//  Card.swift
//  DreamJournal
//
//  Created by CUBS Customer on 11/29/22.
//

import Foundation

struct Card {
    let title: String
    let topic: String
    let emotion: String
    let isFave: Bool
    let date: Date

    static let example = Card(title: "The Best Dream!", topic: "I could fly and I traveled the entire world!", emotion: "Good Dream", isFave: true, date: Date())
}

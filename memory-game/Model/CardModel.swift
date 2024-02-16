//
//  CardModel.swift
//  memory-game
//
//  Created by Denis Coder on 2/5/24.
//

import Foundation

struct Card: Hashable, Identifiable {
    
    let id = UUID()
    let name : String
    let image : String
    var showContent: Bool
}

struct MockData {

    static let sampleCard = Card(name: "lion", image: "lion", showContent: false)
    
    static let sampleArray:[Card] = [
        Card(name: "monkey", image: "monkey", showContent: false),
        Card(name: "monkey", image: "monkey", showContent: false),
        Card(name: "lion", image: "lion", showContent: false),
        Card(name: "lion", image: "lion", showContent: false),
        Card(name: "panda", image: "panda", showContent: false),
        Card(name: "panda", image: "panda", showContent: false),
    ]
    
    
}

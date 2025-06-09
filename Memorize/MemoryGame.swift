//
//  MemoryGame.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/8/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pair in 0..<max(2, numOfPairs) {
            let content = cardContentFactory(pair)
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        let id = UUID()
        let content: CardContent
        var isFaceUp = true
        var isMatched = false

    }
}

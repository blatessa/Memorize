//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/8/25.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["💀", "👻", "🙈", "👋", "👨‍👩‍👧‍👦", "🐶", "🐱", "🐭"]
    
    private static func createGame() -> MemoryGame<String> {
        return MemoryGame(numOfPairs: 6) {
            index in
            if emojis.indices.contains(index) {
                emojis[index]
            } else {
                "😬"
            }
        }
    }
        
    @Published private var model = createGame()

    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

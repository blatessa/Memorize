//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/6/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

//
//  ContentView.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "👻", "🙈", "👋", "👨‍👩‍👧‍👦", "🐶", "🐱", "🐭"]
    
    @State var cardCount = 2
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { idx in
                CardView(emojis[idx])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
        
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool
    
    init(_ name: String, isFaceUp: Bool = true) {
        self.content = name
        self.isFaceUp = isFaceUp
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "👻", "🙈", "👋"]
    
    var body: some View {
                
        HStack {
            ForEach(emojis.indices, id: \.self) { idx in
                CardView(emojis[idx])
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool
    
    init(_ name: String, isFaceUp: Bool = false) {
        self.content = name
        self.isFaceUp = isFaceUp
    }
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 4)
                Text("\(content)").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

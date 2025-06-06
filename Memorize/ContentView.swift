//
//  ContentView.swift
//  Memorize
//
//  Created by Brady LaTessa on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(name: "👻", isFaceUp: true)
            CardView(name: "👋", isFaceUp: false)
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let name: String
    let isFaceUp: Bool
    
    init(name: String, isFaceUp: Bool = false,) {
        self.isFaceUp = isFaceUp
        self.name = name
    }
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 4)
                Text("\(name)").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)            }
        }
    }
}

#Preview {
    ContentView()
}

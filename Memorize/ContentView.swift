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
            CardView("👻", isFaceUp: true)
            CardView("👋", isFaceUp: false)
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let name: String
    @State var isFaceUp: Bool
    
    init(_ name: String, isFaceUp: Bool) {
        self.name = name
        self.isFaceUp = false
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

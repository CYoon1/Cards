//
//  ContentView.swift
//  Blackjack
//
//  Created by Christopher Yoon on 10/26/21.
//

import SwiftUI

struct ContentView: View {
    let deck = Deck()
    var body: some View {
        List {
            ForEach(deck.cards, id: \.id) {
                Text("\($0.number.rawValue) of \($0.suit.rawValue)")
            }
        }
    }
}
enum Suit: String, CaseIterable {
    case Spades = "♠️"
    case Diamonds = "♦️"
    case Hearts = "♥️"
    case Clubs = "♣️"
}

enum Number: String, CaseIterable {
    case two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

struct Card: Identifiable {
    var suit: Suit
    var number: Number
    var id = UUID().uuidString
}

struct Deck: Identifiable {
    var id = UUID().uuidString
    var cards = [Card]()
    init() {
        for suit in Suit.allCases {
            for number in Number.allCases {
                self.cards.append(Card(suit: suit, number: number))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

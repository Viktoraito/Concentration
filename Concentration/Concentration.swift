//
//  Concentration.swift
//  Concentration
//
//  Created by M on 05/01/2019.
//  Copyright © 2019 Viktoraito. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var IndexOfFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = IndexOfFaceUpCard, matchIndex != index {
                //check card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                IndexOfFaceUpCard = nil
            } else {
                //no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                IndexOfFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
}

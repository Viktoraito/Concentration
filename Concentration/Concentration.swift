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
    
    var Score = 0
    var flipCount = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount+=1
            if let matchIndex = IndexOfFaceUpCard, matchIndex != index {
                //check card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    Score+=2
                } else {
                    if cards[matchIndex].wasSeenBefore
                        {Score-=1}
                    if cards[index].wasSeenBefore
                        {Score-=1}
                }
                cards[index].isFaceUp = true
                cards[index].wasSeenBefore = true
                cards[matchIndex].wasSeenBefore = true
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

//
//  ViewController.swift
//  Concentration
//
//  Created by M on 04/01/2019.
//  Copyright © 2019 Viktoraito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    var emojiChoices = ["🐹","🐶","🐱","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵"]
    
    var emoji = [Int:String]()
    
    var flipCount = 0 {
        didSet {
            FlipCountLabel.text = "Перевороты: \(flipCount)"
        }
    }
    
    @IBAction func CardTouched(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.6995851457, green: 0.8596628887, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}


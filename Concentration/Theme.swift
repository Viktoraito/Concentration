//
//  Theme.swift
//  Concentration
//
//  Created by M on 06/01/2019.
//  Copyright © 2019 Viktoraito. All rights reserved.
//

import Foundation

struct Theme {
    static var theme = [
    "Animals":["🐹","🐶","🐱","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵"],
    "Fruits" :["🍏","🍐","🍊","🍋","🍎","🍌","🍉","🍓","🍇","🍒","🍑","🍍","🥝","🥥"],
    "Food"   :["🧀","🥞","🍗","🌭","🍔","🍟","🍕","🥪","🍝","🍦","🍰","🍫","🍩","🥓"],
    "Sport"  :["⚽️","🏀","🏈","🥎","🎾","🏐","🥏","🎱","🏓","🏒","🏹","🥊","🛹","⛸"],
    "Art"    :["🎭","🎨","🎬","🎧","🎼","🥁","🎷","🎸","🎻","🎤","🎪","🎺","🎹","💃"],
    "Clothes":["🧥","👙","👗","👔","👖","🧦","🧤","🧣","👕","👚","🥼","👘","🧢","👒"]
    ]
    
    static func getTheme() -> [String] {
        return theme.randomElement()?.value ?? ["?"]
    }
}

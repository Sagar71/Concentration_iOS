//
//  Concentration.swift
//  Concentration
//
//  Created by Sagar sharma on 27/05/18.
//  Copyright © 2018 Sagar sharma. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCards(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipIndexDown in cards.indices{
                    cards[flipIndexDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards
        {
            let card = Card()
            cards += [card, card]
        }
    }
    
    //Shuffle the Cards
}

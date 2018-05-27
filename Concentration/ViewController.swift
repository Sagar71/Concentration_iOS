//
//  ViewController.swift
//  Concentration
//
//  Created by Sagar sharma on 22/05/18.
//  Copyright © 2018 Sagar sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1)/2)
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton){
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCards(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel(){
        
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.black : UIColor.orange
            }
        }
    }
    
    var emojiChoices = ["👻","🎃","🦇","🍎","🍩","😱","😈","🙀","🤡","👿"]
    var emoji = [Int: String]()
    
    func emoji(for card: Card)->String
    {
        if emoji[card.identifier] == nil, emojiChoices.count > 0
        {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices[randomIndex]
        }
        return emoji[card.identifier] ?? "?"
    }
}


//
//  ViewController.swift
//  ConentrationAssignment
//
//  Created by 典萱 高 on 2018/3/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards:Int {
        get{
            return (cardButtons.count + 1)/2
        }
    }

    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        emojiChoices = getEmojis()
        game.newGame(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }

    }

    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }

        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"

    }

    // private first, then think about it

    private var themes: [Theme] = [
        Theme.animals(emojis: Themes.animalEmojis),
        Theme.flags(emojis: Themes.flagsEmojis),
        Theme.fruits(emojis: Themes.fruitsEmojis),
        Theme.sports(emojis: Themes.sportsEmojis),
        Theme.stationary(emojis: Themes.stationaryEmojis),
        Theme.transportation(emojis: Themes.transportationEmojis)
    ]

    lazy private var emojiChoices: EmojisCollection = {
        let emojis: EmojisCollection = getEmojis()
        return emojis
    } ()

    private func getEmojis() -> EmojisCollection {
        let randomIndex = themes.count.arc4random
        switch themes[randomIndex] {
        case .animals(let emojis): return emojis
        case .flags(let emojis): return emojis
        case .fruits(let emojis): return emojis
        case .sports(let emojis): return emojis
        case .stationary(let emojis): return emojis
        case .transportation(let emojis): return emojis
        }
    }

    private var emojiDictionary = [Int: String]()

    private func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emojiChoices.count > 0 {
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            let randomIndex = emojiChoices.count.arc4random
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        // if it is optional, return "?"
        return emojiDictionary[card.identifier] ?? "?"
    }

}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


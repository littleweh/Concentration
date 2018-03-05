//
//  Concentration.swift
//  ConentrationAssignment
//
//  Created by 典萱 高 on 2018/3/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

import Foundation

class Concentration {

    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        // ignore cards are matched
        if !cards[index].isMatched {
            // 3 cases:
            // 1) no cards are faced up, just flip the card
            // 2) two cards are faced up, click a new card, the two cards should be flipped over (face down)
            // 3) only one card is faced up,
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
        
    }

    init(numberOfPairsOfCards: Int) {
        //countableRange
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards

    }


}

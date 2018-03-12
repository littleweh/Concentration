//
//  Concentration.swift
//  ConentrationAssignment
//
//  Created by 典萱 高 on 2018/3/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

import Foundation

enum ScoreScenario {
    case match, penalty, none
}

struct Concentration {

    // you can see the cards, but setting it is my job
    // value types
    private(set) var cards = [Card]()
    private(set) var flipCount: Int = 0
    private(set) var score: Int = 0
    private var winScore = 2
    private var penaltyScore = -1

    // lecture 3
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) { // local variable default: newValue
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    mutating func setScore(with scenario: ScoreScenario) {
        switch scenario {
        case .match:
            score += winScore
        case .penalty:
            score += penaltyScore
        case .none:
            break
        }
        
    }

    mutating func chooseCard(at index: Int) {
        assert(
            cards.indices.contains(index),
            "Concentration.chooseCard(at: \(index)): chosen index not in the cards"
        )
        // ignore cards are matched

        flipCount += 1

        if !cards[index].isMatched {
            // 3 cases:
            // 1) no cards are faced up, just flip the card
            // 2) two cards are faced up, click a new card, the two cards should be flipped over (face down)
            // 3) only one card is faced up

            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match

                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true

                    setScore(with: .match)
                } else {
                    if cards[index].faceUpCount > 0 {
                        setScore(with: .penalty)
                    }
                    if cards[matchIndex].faceUpCount > 1 {
                        setScore(with: .penalty)
                    }
                }

                cards[index].isFaceUp = true

            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
    }

    mutating func newGame(numberOfPairsOfCards: Int) {
        //countableRange
        cards = []
        flipCount = 0
        score = 0

        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
//         TODO: Shuffle the cards: Knuth Shuffle
        for index in cards.indices {
            // last ver
            let unshuffledCardsLastIndex = cards.count - 1 - index
            let randomIndex = unshuffledCardsLastIndex.arc4random
            cards.swapAt(unshuffledCardsLastIndex, randomIndex)

            // first ver
            //            let randomIndex_ = (cards.count - index).arc4random
            //            cards.swapAt(index, randomIndex + index)

        }
    }

    init(numberOfPairsOfCards: Int) {
        assert(
            numberOfPairsOfCards > 0,
            "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards"
        )
        newGame(numberOfPairsOfCards: numberOfPairsOfCards)

    }


}

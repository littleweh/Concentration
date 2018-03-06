//
//  Card.swift
//  ConentrationAssignment
//
//  Created by 典萱 高 on 2018/3/1.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false {
        didSet {
            if isFaceUp {
                faceUpCount += 1
            }
        }
    }
    var isMatched = false
    var identifier: Int
    var faceUpCount: Int = 0

    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

    
}

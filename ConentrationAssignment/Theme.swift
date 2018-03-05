//
//  Theme.swift
//  ConentrationAssignment
//
//  Created by 典萱 高 on 2018/3/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

import Foundation
typealias EmojisCollection = [String]

let emojiThemesObject: [Theme: EmojisCollection] = [
    .animals: Themes.animalEmojis,
    .fruits: Themes.fruitsEmojis,
    .sports: Themes.sportsEmojis,
    .flags: Themes.flagsEmojis,
    .transportation: Themes.transportationEmojis,
    .stationary: Themes.stationaryEmojis
]

enum Theme: Int {
    case animals = 0, fruits, sports, flags, transportation, stationary
    static let count: Int = {
        var max: Int = 0
        while let _ = Theme(rawValue: max) {max += 1}
        return max
    }()
}

struct Themes {
    static private(set) var animalEmojis: EmojisCollection = [
        "🐶", "🐰", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐷", "🐵", "🐧", "🐔", "🦄", "🐝", "🐌", "🦋", "🦀", "🐬", "🦐"
    ]

    static private(set) var fruitsEmojis: EmojisCollection = [
        "🍓", "🍎", "🍌", "🍍", "🍉", "🍒", "🍇", "🍋", "🍐", "🍊", "🍏", "🍈", "🥥", "🥝", "🍑"
    ]

    static private(set) var sportsEmojis: EmojisCollection = [
        "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🏒", "⛳️", "🥊", "⛸", "🥋", "🏋🏻‍♀️", "🚴🏾‍♂️", "🏊🏻‍♂️", "🏄🏿‍♀️"
    ]

    static private(set) var flagsEmojis: EmojisCollection = [
        "🇹🇹", "🇹🇷", "🇹🇨", "🇹🇲", "🇧🇹", "🇨🇫", "🇩🇰", "🇧🇧", "🇯🇵", "🇧🇪", "🇯🇲", "🇮🇱", "🇨🇦", "🇬🇦", "🇲🇵", "🇰🇵", "🇶🇦", "🇬🇲", "🇩🇯"
    ]

    static private(set) var transportationEmojis: EmojisCollection = [
        "🚗", "🛴", "🚲", "🛵", "🏍", "🚘", "🚃", "🚂", "✈️", "🚀", "🚁", "🛳", "🛥", "🚢", "🛩", "🚅"
    ]

    static private(set) var stationaryEmojis: EmojisCollection = [
        "📎", "🖇", "📐", "📏", "📌", "📍", "✂️", "🖊", "🖌", "🖍", "✏️", "🔍", "🔐", "📕", "📗", "📒", "📚", "🔖"
    ]

}



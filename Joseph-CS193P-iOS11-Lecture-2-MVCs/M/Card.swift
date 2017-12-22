//
//  Card.swift
//  Joseph-CS193P-iOS11-Lecture-2-MVCs
//
//  Created by chenjian on 2017/12/22.
//  Copyright © 2017年 chenjian. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var _uniqueIdentifier = 0
    private static var uniqueIdentifier: Int {
        _uniqueIdentifier += 1
        return _uniqueIdentifier
    }
    
    init() {
        identifier = Card.uniqueIdentifier
    }
}

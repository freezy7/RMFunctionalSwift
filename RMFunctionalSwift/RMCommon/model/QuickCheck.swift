//
//  QuickCheck.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/6/8.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class QuickCheck: NSObject {

}

protocol Arbitary {
    static func arbitrary() -> Self
}

extension Int: Arbitary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}

extension Int {
    static func random(from from: Int, to: Int) -> Int {
        return from + (Int(arc4random()))%(to - from)
    }
}



extension Character: Arbitary {
    static func arbitrary() -> Character {
        return Character(UnicodeScalar(Int.random(from: 65, to: 90)))
    }
}

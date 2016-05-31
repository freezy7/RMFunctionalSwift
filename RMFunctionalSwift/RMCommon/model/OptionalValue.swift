//
//  OptionalValue.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/5/31.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class OptionalValue: NSObject {

}

struct Order {
    let orderNumber: Int
    let person: Person?
}

struct Person {
    let name: String
    let address: Address?
}

struct Address {
    let streetNmae: String
    let city: String
    let state: String?
}

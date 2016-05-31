//
//  HighFunction.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/5/31.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class HighFunction: NSObject {

}

func incrementArray(xs: [Int]) -> [Int] {
    var result: [Int] = []
    for x in xs {
        result.append(x + 1)
    }
    return result
}

func doubleArray1(xs: [Int]) -> [Int] {
    var result: [Int] = []
    for x in xs {
        result.append(x*2)
    }
    return result
}

func computeIntArray(xs: [Int], transform: Int -> Int) -> [Int] {
    var result:[Int] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func doubleArray2(xs: [Int]) -> [Int] {
    return computeIntArray(xs, transform: {x in x*2})
}

func genericComputeArray1<T>(xs: [Int], transform: Int -> T) -> [T] {
    var result: [T] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func map<Element, T>(xs: [Element], transfotm: Element -> T) -> [T] {
    var result:[T] = []
    for x in xs {
        result.append(transfotm(x))
    }
    return result
}

func genericComputeArray2<T>(xs: [Int], transform: Int -> T) -> [T] {
    return map(xs, transfotm: transform)
}

//顶层函数和扩展

func filter<T>(xs: [T], includeElement: T -> Bool) -> [T] {
    var result: [T] = []
    for x in xs where includeElement(x) {
        result.append(x)
    }
    return result
}

func reduce<Element, T>(xs:[Element], initial: T, combine:(T, Element) -> T) -> T {
    var result = initial
    for x in xs {
        result = combine(result, x)
    }
    return result
}

struct City {
    let name:String
    let population:Int
}

extension City {
    func cityByScalingPopulation() -> City {
        return City(name: name, population: population*1000)
    }
}






//
//  BattleShip.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/5/25.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class BattleShip: NSObject {
    
    

}


typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    func inRange(range:Distance) -> Bool {
        return sqrt(x*x + y*y) <= range
    }
    
    func minus(p:Position) -> Position {
        return Position(x:x-p.x, y:y-p.y)
    }
    
    var length: Double {
        return sqrt(x*x + y*y)
    }
    
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canEngageShip(target:Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        return targetDistance <= firingRange
    }
    
    func canSafeleyEngageShip(target:Ship, friendly:Ship) -> Bool {
//        let dx = target.position.x - position.x
//        let dy = target.position.y - position.y
//        let targetDistance = sqrt(dx*dx + dy*dy)
//        return targetDistance <= firingRange && targetDistance > unsafeRange
        let rangeRegion = difference(circle(firingRange), minus: circle(unsafeRange))
        let firingRegion = shift(rangeRegion, offset: position)
        let friendlyRegion = shift(circle(unsafeRange), offset: friendly.position)
        let resultRegion = difference(firingRegion, minus: friendlyRegion)
        
        return resultRegion(target.position)
    }
    
    func canSafeleyEngageShip1(target:Ship, friendly:Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx*friendlyDx + friendlyDy*friendlyDy)
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && friendlyDistance > unsafeRange
    }
    
    func canSafeleyEngageShip2(target: Ship, friendly:Ship) -> Bool {
        let targetDistance = target.position.minus(position).length
        let friendlyDistance = target.position.minus(friendly.position).length
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && friendlyDistance > unsafeRange
    }
}

func pointInRange(point: Position) -> Bool {
    return true
}

typealias Region = Position -> Bool

func circle(radius: Distance) -> Region {
    return {point in point.length <= radius}
}

func circle2(radius: Distance, center: Position) -> Region {
    return {point in point.minus(center).length <= radius}
}

func shift(region: Region, offset: Position) -> Region {
    return {point in region(point.minus(offset))}
}

func invert(region: Region) -> Region {
    return {point in !region(point)}
}

func intersection(region1: Region, _ region2: Region) -> Region {
    return {point in region1(point)&&region2(point)}
}

func union(region1: Region, _ region2: Region) -> Region {
    return {point in region1(point)||region2(point)}
}

func difference(region: Region, minus: Region) -> Region {
    return intersection(region, invert(minus))
}



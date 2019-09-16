//
//  PlayerObject.swift
//  testApp
//
//  Created by Ben Purdy on 5/24/19.
//  Copyright © 2019 Ben Purdy. All rights reserved.
//

import Foundation
class PlayerObject{
    var playerName: String
    var NumberOfHits: Int = 0
    var NumberOfMisses: Int = 0
    
    init(name: String){
        playerName = name
    }
    func addHit(num:Int){
        NumberOfHits += 1
    }
    func addMiss(num:Int){
        NumberOfMisses += 1
    }
    func getHits() -> Int{
        return NumberOfHits
    }
    func getMisses() -> Int{
        return NumberOfMisses
    }
    func getName() -> String{
        return playerName
    }
}

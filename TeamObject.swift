//
//  TeamObject.swift
//  testApp
//
//  Created by Ben Purdy on 5/24/19.
//  Copyright © 2019 Ben Purdy. All rights reserved.
//

import Foundation
class teamObject{
    var teamName: String
    var list: NodeList!
    
    init(name: String){
        self.teamName = name
        self.list = NodeList()
        
    }
    public func add(addedPlayer: PlayerObject){
        list.linkNode(node: Node(player: addedPlayer))
    }
    public func addByName(player: String){
        let addedPlayer = PlayerObject(name: player)
        list.linkNode(node: Node(player: addedPlayer))
        
    }
    
    public func getName(name: String) -> String{
        return teamName
    }
    public func PrintTeamNames(){
       list.printList()
    }
}

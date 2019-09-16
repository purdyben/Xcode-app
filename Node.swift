//
//  Node.swift
//  testApp
//
//  Created by Ben Purdy on 5/24/19.
//  Copyright © 2019 Ben Purdy. All rights reserved.
//

import Foundation
class Node{
    var right : Node!
    var player: PlayerObject!
    
    
    init(player: PlayerObject){
        self.player = player
        
    }
    init(){
        self.player = PlayerObject(name: "Null")
    }
    func setRight(node: Node){
        self.right = node
    }
    func getPlayer() -> PlayerObject{
        return player
    }
    func getrightNode() -> Node{
        return right
    }
    
}
class NodeList{
    var head: Node!
    var size: Int
    
    init(head: Node){
        self.head = head
        self.head.right = head
        self.size = 1
    }
    init(){
        self.size = 0
    }
    func linkNode(node: Node){
        size+=1
        if(head === nil){
            head = node
            self.head.right = head
        }else{
            var current: Node = head
            while(current.getrightNode() !== head){
                current = current.right
            }
            
            current.right = node
            node.right = head
        }
    }
    func Movehead(head: Node, newHead: Node){
        self.head = newHead
    }
    func nextNode(node: Node) -> Node{
        
        return node.getrightNode()
    }
    func getSize() -> Int{
        return size
    }
    func printList(){
        let itr = nodeIterator(current: head, size: size)
        print(itr.current.getPlayer().getName())
        itr.next()
        while(itr.current !== head){
            print(itr.current.getPlayer().getName())
            itr.next()
        }
    }
    
}
class nodeIterator{
    let size: Int
    var current: Node
    var pending: Node!
    
    init(current: Node, size: Int){
        self.size = size
        self.current = current
        pending = nil
    }
    func next(){
        pending = current
        current = current.getrightNode()
    }
    func previous(){
        current = pending
        let num:Int = 0;
        var node = current
        while(num < size){
            node = node.getrightNode()
        }
        pending = node
    }
    func getPending() -> Node {
        return pending
    }
}

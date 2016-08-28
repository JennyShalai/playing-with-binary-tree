//
//  tree.swift
//  play-with-binary-tree
//
//  Created by Jenny on 8/27/16.
//  Copyright © 2016 FIS. All rights reserved.
//

import Foundation

class Tree {

    var head: Node
    var level: Int = 1
    
    
    init(head: Node) {
        self.head = head
    }
    
    func addNode(node: Node) {
        
        var h = self.head
        let value = node.value
        while true {
            if value <= h.value && h.leftChild == nil {
                h.leftChild = node
                break
            }
            
            if value > h.value && h.rightChild == nil {
                h.rightChild = node
                break
            }
            
            if value <= h.value && h.leftChild != nil {
                h = h.leftChild!
            }
            
            if value > h.value && h.rightChild != nil {
                h = h.rightChild!
            }
        }
    }
    
    func printTree() {
        self.printSubTree(self.head)
    }
    
    private func printSubTree(head: Node) {
        
        if head.leftChild != nil {
            printSubTree(head.leftChild!)
        }
        
        print("\(head.value)")
        
        if head.rightChild != nil {
            printSubTree(head.rightChild!)
        }
    }
}
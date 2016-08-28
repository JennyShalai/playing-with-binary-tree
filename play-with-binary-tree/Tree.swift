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
    
    // add Node into Tree
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
    
    // print tree in console as value of each node 
    // from lowest to highest
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
    
    // looking for node and return TRUE 
    // if could find one, FALSE otherwise
    func findNode(nodeValue: Int) -> Bool {
        var h = self.head
        while true {
            if nodeValue == h.value {
                return true
            } else if nodeValue < h.value && h.leftChild != nil {
                h = h.leftChild!
            } else if nodeValue > h.value && h.rightChild != nil {
                h = h.rightChild!
            } else {
                return false
            }
        }
    }
    
    // find min node in tree
    private func minLeafInTreeWith(head: Node) -> Node {
        var minLeaf: Node = head
        while true {
            if minLeaf.leftChild != nil {
                minLeaf = minLeaf.leftChild!
            } else {
                return minLeaf
            }
        }
    }
    
    // find max node in tree
    private func maxLeafInTreeWith(head: Node) -> Node {
        var maxLeaf: Node = head
        while true {
            if maxLeaf.rightChild != nil {
                maxLeaf = maxLeaf.rightChild!
            } else {
                return maxLeaf
            }
        }
    }
    
    // max leaf in left sub-tree
    func maxLeafInLeftSubTree() -> Node {
        let max = self.head
        if max.leftChild != nil {
            return self.maxLeafInTreeWith(max.leftChild!)
        }
        return max
    }
    
    // min leaf in right sub-tree
    func minLeafInRightSubTree() -> Node {
        let min = self.head
        if min.rightChild != nil {
            return self.minLeafInTreeWith(min.rightChild!)
        }
        return min
    }
    
    
    
}
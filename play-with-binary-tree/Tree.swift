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
                node.parent = h
                break
            }
            
            if value > h.value && h.rightChild == nil {
                h.rightChild = node
                node.parent = h
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
    
    // looking for node in tree
    func findNode(nodeValue: Int) -> Node? {
        var h = self.head
        while true {
            if nodeValue == h.value {
                return h
            } else if nodeValue < h.value && h.leftChild != nil {
                h = h.leftChild!
            } else if nodeValue > h.value && h.rightChild != nil {
                h = h.rightChild!
            } else {
                return nil
            }
        }
    }
    
    // find min node
    private func minLeafInTreeWithHead(head: Node) -> Node {
        var minLeaf: Node = head
        while true {
            if minLeaf.leftChild != nil {
                minLeaf = minLeaf.leftChild!
            } else {
                return minLeaf
            }
        }
    }
    
    // find max node
    private func maxLeafInTreeWithHead(head: Node) -> Node {
        var maxLeaf: Node = head
        while true {
            if maxLeaf.rightChild != nil {
                maxLeaf = maxLeaf.rightChild!
            } else {
                return maxLeaf
            }
        }
        
        
    }
    
    
    // delete node in tree
    func deleteNode(value: Int) {
        
        // checking provided node exists in tree
        if let nodeForDeletion = self.findNode(value) {
            
            // delete root
            if nodeForDeletion.leftChild == nil && nodeForDeletion.rightChild == nil && nodeForDeletion.parent == nil {
                print("trying to delete root!")
            }
            
            // delete leaf (no children)
            if nodeForDeletion.leftChild == nil && nodeForDeletion.rightChild == nil && nodeForDeletion.parent != nil {
                if nodeForDeletion.value == nodeForDeletion.parent!.leftChild?.value {
                    nodeForDeletion.parent!.leftChild = nil
                } else {
                    nodeForDeletion.parent!.rightChild = nil
                }
            }
            
            // delete node
            // take right sub-tree as new node
            if nodeForDeletion.rightChild != nil {
                
                let newNode = self.minLeafInTreeWithHead(nodeForDeletion.rightChild!)
                
                // 1
                newNode.rightChild = nodeForDeletion.rightChild
                // 2
                newNode.leftChild = nodeForDeletion.leftChild
                // 3
                nodeForDeletion.rightChild!.parent = newNode
                // 4
                if nodeForDeletion.leftChild != nil {
                    nodeForDeletion.leftChild?.parent = newNode
                }
                // 5 
                if newNode.parent!.leftChild?.value == newNode.value {
                    newNode.parent!.leftChild = nil
                }
                // 6-7
                newNode.parent = nodeForDeletion.parent
                // 8
                nodeForDeletion.parent?.leftChild = newNode
                
                
            // take left sub-tree as new node 
            } else if nodeForDeletion.leftChild != nil {
                
                let newNode = self.maxLeafInTreeWithHead(nodeForDeletion.leftChild!)
                
                newNode.rightChild = nodeForDeletion.rightChild
                
                newNode.leftChild = nodeForDeletion.leftChild
                
                nodeForDeletion.leftChild!.parent = newNode
                
                if nodeForDeletion.rightChild != nil {
                    nodeForDeletion.rightChild?.parent = newNode
                }
                
                if newNode.parent!.rightChild?.value == newNode.value {
                    newNode.parent!.rightChild = nil
                }
                
                newNode.parent = nodeForDeletion.parent
                
                nodeForDeletion.parent?.rightChild = newNode
                
            }
            
            
            
        }
        
    }
    
}
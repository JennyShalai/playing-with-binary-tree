//
//  main.swift
//  play-with-binary-tree
//
//  Created by Jenny on 8/27/16.
//  Copyright © 2016 FIS. All rights reserved.
//

import Foundation

var tree = Tree.init(head: Node.init(value: 10))
let nodes: [Int] = [5, 8, 1, 6, 9, 15, 11, 18]
for node in nodes {
    tree.addNode(Node.init(value: node))
}
tree.printTree()
print(tree.head)

// isNodeInTree?
if let node = tree.findNode(11) {
    print(node)
} else {
    print("Node not found")
}
if let node = tree.findNode(12) {
    print(node)
} else {
    print("Node not found")
}


//tree.deleteNode(5)
//tree.printTree()
print("-----")
tree.deleteNode(18)
tree.printTree()
print("-----")
//tree.deleteNode(10) // doesn't work
//tree.printTree()
tree.deleteNode(15) // doesn't work
tree.printTree()

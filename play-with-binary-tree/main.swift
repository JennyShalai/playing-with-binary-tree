//
//  main.swift
//  play-with-binary-tree
//
//  Created by Jenny on 8/27/16.
//  Copyright © 2016 FIS. All rights reserved.
//

import Foundation

var tree = Tree.init(head: Node.init(value: 10))
tree.addNode(Node.init(value: 5))
tree.addNode(Node.init(value: 8))
tree.addNode(Node.init(value: 1))
tree.addNode(Node.init(value: 6))
tree.addNode(Node.init(value: 9))
tree.addNode(Node.init(value: 15))
tree.addNode(Node.init(value: 11))
tree.addNode(Node.init(value: 18))
tree.printTree()

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

tree.printTree()
tree.deleteNode(5)
tree.printTree()
tree.deleteNode(18)
tree.printTree()
tree.deleteNode(10) // doesn't work
tree.printTree()
tree.deleteNode(15) // doesn't work
tree.printTree()

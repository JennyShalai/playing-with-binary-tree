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
print(tree.findNode(11))
print(tree.findNode(12))

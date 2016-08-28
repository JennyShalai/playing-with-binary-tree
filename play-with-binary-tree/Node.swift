//
//  Node.swift
//  play-with-binary-tree
//
//  Created by Jenny on 8/27/16.
//  Copyright © 2016 FIS. All rights reserved.
//

import Foundation

class Node: CustomStringConvertible {
    
    var value: Int
    var leftChild: Node?
    var rightChild: Node?
    var parent: Node?
    var description: String {
        return "Node[\(self.value)]"
    }
    
    init(value: Int){
        self.value = value
    }
    
    
    
}
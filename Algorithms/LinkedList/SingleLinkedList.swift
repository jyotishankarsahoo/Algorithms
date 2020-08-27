//
//  SingleLinkedList.swift
//  Algorithms
//
//  Created by Jyoti Sahoo on 8/26/20.
//  Copyright © 2020 Jyoti Sahoo. All rights reserved.
//

import Foundation

class SLLNode {
    var value: Int
    var next: SLLNode?
    init(_ value: Int) {
        self.value = value
    }
}
// Create Linked List
// Reverse Linked List
// Delete Node Linked List
// Display Linked List
// Sort Linked List
// Target Sum Linked List
// Remove Duplicates
// Find Nth Node
class SingleLinkedList {
    var head: SLLNode?

    func createSingleLinkedList(_ array: [Int]){
        array.forEach({ appendNode(value: $0) })
    }

    func appendNode(value: Int) {
        let newNode = SLLNode(value)
        if head == nil {
            head = newNode
        } else {
            var curNode = head
            var prev: SLLNode?
            while curNode != nil {
                prev = curNode
                curNode = curNode?.next
            }
            prev?.next = newNode
        }
    }

    func reverse() {
        if head == nil {
            print("Empty List")
            return
        }
        var cur = head
        var prev: SLLNode?
        while cur != nil {
            let curNext = cur?.next
            cur?.next = prev
            prev = cur
            cur = curNext
        }
        head = prev
    }

    func delete(_ value: Int) {
        if head == nil {
            print("Empty List")
            return
        }
        var cur = head
        if head?.value == value {
            head = cur?.next
            cur = nil
        } else {
            var prev: SLLNode?
            while cur != nil && cur?.value != value {
                prev = cur
                cur = cur?.next
            }
            if cur == nil {
                print("Element not found")
                return
            } else {
                prev?.next = cur?.next
                cur = nil
            }
        }
    }

    func sort(){
        var cur = head
        if head == nil { return }
        while cur != nil {
            var index = cur?.next
            while index != nil {
                if cur!.value > index!.value {
                    (cur!.value, index!.value) = (index!.value, cur!.value)
                }
                index = index?.next
            }
            cur = cur?.next
        }
    }
/*
     sum = 5
     input = [1,2,3,4,5]
     1:4
     2:3
     3:2
     4:1
     5:0
     
*/
    func targetSum(_ sum: Int){
        var mappingDict = [Int: Int]()
        var cur = head
        while cur != nil {
            let complement = sum - cur!.value
            if let _ = mappingDict[complement] {
                print("Found sum: \(cur!.value) + \(complement) = \(sum)")
                return
            } else {
                mappingDict[cur!.value] = complement
            }
            cur = cur?.next
        }
        print("Sum not found")
    }

    func displayList() {
        if head == nil { print("Empty List") }
        else {
            var cur = head
            while cur != nil {
                print("Node:\(cur!.value)")
                cur = cur?.next
            }
        }
    }
    func findNthNode(_ distance: Int) {
        guard let _ = head else { return }
        var cur = head
        var count = 0
        while count != distance && cur != nil {
            cur = cur?.next
            count += 1
        }
        if cur == nil {
            print("No Nodes")
        } else {
            print("Node at Index \(distance): \(cur!.value)")
        }
    }
    func removeDuplicates() {
        var mappingDict = [Int: Int]() // Value: Count
        var cur = head
        var prev: SLLNode?
        while cur != nil {
            if let _ = mappingDict[cur!.value] {
                prev?.next = cur?.next
                cur = nil
            } else {
                mappingDict[cur!.value] = 1
                prev = cur
            }
            cur = prev?.next
        }
    }
}

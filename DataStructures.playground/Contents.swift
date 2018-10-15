import UIKit

//let tree = AVLTree<Int>()
//
//for i in -6..<7 {
//
//    tree.insert(i)
//}
//
////tree.insert(1)
//
//tree.insert(2)
//tree.insert(3)
//tree.insert(4)
//tree.insert(6)
//tree.insert(7)
//tree.insert(8)
//tree.insert(9)
//tree.insert(10)
//tree.insert(12)
//tree.insert(20)
//tree.insert(-20)
//tree.insert(5)
//tree.insert(11)
//
//print("Level order: \(tree.getValuesInLevelOrder())\n")
//print(3)


public protocol Node {

    associatedtype Value
    
    var value: Value { get }
    var next: Self? { get set }
}

public final class LinkedListNode<T: Comparable>: Node {
    
    public let value: T
    public var next: LinkedListNode<T>?
    
    public init(_ value: T) {
        self.value = value
    }
}

public class SinglyLinkedList<T: Comparable> {
    var head: LinkedListNode<T>?
    var tail: LinkedListNode<T>?
    
    public init() { }
    
    // O(1)
    public func append(value: T) {
        let node = LinkedListNode(value)
        
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }
        
        tail = node
    }
    
    
    // Delete O(n)
    public func delete(value: T) {
        var current = head
        var previous = head
        
        while current != nil {
            if current!.value == value {
                previous.next = current.next
                break
            }
            
            previous = current
            current = current.next
        }
    }
    
    public func deleteAll(value: T) {
        
        var current = head.next
        var previous = head
        
        while current != nil {
            if current!.value == value {
                previous.next = current.next
            } else {
                previous = current
            }
            
            current = current.next
        }
    }
}



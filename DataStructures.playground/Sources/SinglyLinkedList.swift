import Foundation

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
    var size: Int = 0
    
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
        
        size += 1
    }
    
    
    // Delete O(n)
    public func deleteFirst(value: T) {
        
        var current = head
        var previous: LinkedListNode<T>?
        
        while current != nil {
            
            if current!.value == value {
                
                if previous != nil {
                    previous?.next = current?.next
                } else { // Previous pointing anywhere
                    head = current?.next
                }
                
                size -= 1
                break
            }
            
            previous = current
            current = current?.next
        }
    }
    
    public func deleteAll(value: T) {
        
        var current = head
        var previous: LinkedListNode<T>?
        
        while current != nil {
            
            if current!.value == value {
                
                if previous != nil {
                    previous?.next = current?.next
                } else {
                    head = current?.next
                }
                
                size -= 1
                
            } else {
                previous = current
            }
            
            current = current?.next
        }
    }
    
    public func values() -> [T] {
        
        var result: [T] = []
        var current = head
        
        while current != nil {
            result.append(current!.value)
            
            current = current?.next
        }
        
        return result
    }
    
    public func nthToLast(n: Int) -> LinkedListNode<T>? {
        
        guard n >= 0 && n < size else { return nil }
        
        // n = 2    |
        // 7->5->4->3->2->1
        //       ^ Then, start runner
        
        var current = head
        
        // skip first n elements
        
        for _ in 0..<n {
            current = current?.next
        }
        
        var runner = head
        
        while current?.next != nil {
            current = current?.next
            runner = runner?.next
        }
        
        return runner
    }
    
    public func getHead() -> LinkedListNode<T>? {
        
        guard let head = self.head else { return nil }
        
        // 5->4->2->3
        //    ^
        // 5->
        
        let newHead = LinkedListNode<T>(head.value)
        var current = newHead
        var runner = self.head
        
        while runner?.next != nil {
            
            current.next = LinkedListNode(runner!.next!.value)
            current = current.next!
            runner = runner?.next
        }
        
        return newHead
        
    }
}

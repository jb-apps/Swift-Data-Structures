import Foundation


// Utilities

public struct SinlgyLinkedListUtilities {
    
    public static func values<T>(head: LinkedListNode<T>?) -> [T] {
        
        var values:[T] = []
        
        var current: LinkedListNode<T>? = head
        
        while current != nil {
            
            values.append(current!.value)
            
            current = current?.next
        }
        
        return values
    }
    
    public static func addLists(list1: LinkedListNode<Int>?, list2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        
        switch (list1, list2) {
            
        case let (.some(rootL1), .some(rootL2)):
            return helperAddLists(l1: rootL1, l2: rootL2)
            
        case (.some(let root), .none):
            return root
            
        case (.none, .some(let root)):
            return root
            
        default:
            return nil
        }
    }
}

private extension SinlgyLinkedListUtilities {
    
    private static func helperAddLists(l1: LinkedListNode<Int>, l2: LinkedListNode<Int>) -> LinkedListNode<Int> {
        
        var currentL1: LinkedListNode<Int>? = l1
        var currentL2: LinkedListNode<Int>? = l2
        
        var solutionRunner: LinkedListNode<Int>?
        var solutionHead: LinkedListNode<Int>?
        
        var carry = 0
        
        while currentL1 != nil || currentL2 != nil {
            
            let value: Int
            
            switch (currentL1, currentL2) {
                
            case let (.some(nodeL1), .some(nodeL2)):
                value = nodeL1.value + nodeL2.value + carry
                currentL1 = currentL1?.next
                currentL2 = currentL2?.next
                
            case let (.some(nodeL1), .none):
                value = nodeL1.value + carry
                currentL1 = currentL1?.next
                
            case let (.none, .some(nodeL2)):
                value = nodeL2.value + carry
                currentL2 = currentL2?.next
                
            default:
                value = 0
                break
            }
            
            let newNode = LinkedListNode(value % 10)
            
            if solutionRunner != nil {
                
                solutionRunner?.next = newNode
                solutionRunner = solutionRunner?.next
            } else {
                
                solutionRunner = newNode
                solutionHead = newNode
            }
            
            carry = value > 9 ? 1:0
        }
        
        
        // Check for carry in case is 1
        
        if carry == 1 {
            solutionRunner?.next = LinkedListNode(1)
        }
        
        return solutionHead!
    }
}

// Examples

//let list1 = SinglyLinkedList<Int>()
//let list2 = SinglyLinkedList<Int>()
//
//for _ in 0..<20 {
//    list1.append(value: 9)
//    list2.append(value: 9)
//}
//
//print(list1.values())
//print(list2.values())
//
//let resultList = SinlgyLinkedListUtilities.addLists(list1: list1.getHead(), list2: list2.getHead())
//
//print(SinlgyLinkedListUtilities.values(head: resultList))

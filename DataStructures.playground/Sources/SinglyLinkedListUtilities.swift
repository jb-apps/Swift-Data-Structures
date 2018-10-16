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
    
    public static func addListsIterative(list1: LinkedListNode<Int>?, list2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        
        var currentL1: LinkedListNode<Int>? = list1
        var currentL2: LinkedListNode<Int>? = list2
        
        var solutionRunner: LinkedListNode<Int>?
        var solutionHead: LinkedListNode<Int>?
        
        var carry = 0
        
        while currentL1 != nil || currentL2 != nil {
            
            var value: Int = 0
            
            if currentL1 != nil {
                value += currentL1!.value
                currentL1 = currentL1?.next
            }
            
            if currentL2 != nil {
                value += currentL2!.value
                
                currentL2 = currentL2?.next
            }
            
            value += carry
            
            let node = LinkedListNode(value % 10)
            
            if solutionHead == nil {
            
                solutionHead = node
                solutionRunner = node
            } else {
                
                solutionRunner?.next = node
                solutionRunner = solutionRunner?.next
            }
            
            carry = value > 9 ? 1:0
        }
        
        if carry == 1 {
            solutionRunner?.next = LinkedListNode(1)
        }
        
        return solutionHead
    }
    
    public static func addListsRecursive(list1: LinkedListNode<Int>?, list2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        
        func helper(l1: LinkedListNode<Int>?, l2: LinkedListNode<Int>?, carry: Int = 0) -> LinkedListNode<Int>? {
            
            if l1 == nil && l2 == nil {
                if carry == 1 {
                    return LinkedListNode(1)
                } else {
                    return nil
                }
            }
            
            var value = carry
            
            if l1 != nil {
                value += l1!.value
            }
            
            if l2 != nil {
                value += l2!.value
            }
            
            let node = LinkedListNode(value % 10)

            node.next = helper(l1: l1?.next ?? nil, l2: l2?.next ?? nil, carry: value > 9 ? 1:0)
            
            return node
        }
        
        
        return helper(l1: list1, l2: list2, carry: 0)
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

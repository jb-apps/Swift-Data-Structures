import Foundation

public struct Examples {
    
    public struct TreeExamples {
        
        public static func avlTree(values: [Int] = [1,2,3,4,5,6]) {
            
            print("---- Running AVL Tree example ----")
            print("Values introduced in order: \(values)")
            
            let tree = AVLTree<Int>()
            
            values.forEach { tree.insert($0) }
            
            print("Level order: \(tree.getValuesInLevelOrder())\n")
            print("\n")
        }
    }
    
    public struct SinglyLinkedListExamples {
        
        public static func addTwoRandomLinkedListsIterative(sizeL1: Int = 5, sizeL2: Int = 5) {
            
            print("---- Running add two linked lists example ----")
            
            let list1 = SinglyLinkedList<Int>()
            let list2 = SinglyLinkedList<Int>()
            
            for _ in 0..<sizeL1 {
                list1.append(value: Int.random(in: 0...9))
            }
            
            for _ in 0..<sizeL2 {
                list2.append(value: Int.random(in: 0...9))
            }
            
            print("list 1: \(list1.values())")
            print("list 2: \(list2.values())")
            
            let resultList = SinlgyLinkedListUtilities.addListsIterative(list1: list1.getHead(), list2: list2.getHead())
            
            print("result: \(SinlgyLinkedListUtilities.values(head: resultList))")
            print("\n")
        }
        
        public static func addTwoLinkedListsIterative(headL1: LinkedListNode<Int>?, headL2: LinkedListNode<Int>?) {
            
            print("---- Running add two linked lists ----")
            
            let resultList = SinlgyLinkedListUtilities.addListsIterative(list1: headL1, list2: headL2)
            
            print("result: \(SinlgyLinkedListUtilities.values(head: resultList))")
            print("\n")
        }
        
        public static func addTwoLinkedListsIterativeWith(valuesL1: [Int], valuesL2: [Int]) {
            
            print("---- Running add two linked lists example ----")
            
            let list1 = SinglyLinkedList<Int>()
            let list2 = SinglyLinkedList<Int>()
            
            for value in valuesL1 {
                list1.append(value: value)
            }
            
            for value in valuesL2 {
                list2.append(value: value)
            }
            
            print("list 1: \(list1.values())")
            print("list 2: \(list2.values())")
            
            let resultList = SinlgyLinkedListUtilities.addListsIterative(list1: list1.getHead(), list2: list2.getHead())
            
            print("result: \(SinlgyLinkedListUtilities.values(head: resultList))")
            print("\n")
        }
    }
}

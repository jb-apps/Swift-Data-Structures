import Foundation

public final class BinarySearchTreeNode<Element: Comparable>: BalancedTreeNode {
    
    public var value: Element
    public var height: Int = 1
    public var left: BinarySearchTreeNode<Element>?
    public var right: BinarySearchTreeNode<Element>?
    
    public init(_ value: Element) {
        self.value = value
    }
}

public final class AVLTree<Element: Comparable>: Tree {
    
    private typealias Height = Int
    
    var root: BinarySearchTreeNode<Element>?
    
    public init() { }
    
    public func insert(_ newValue: Element) {
        
        root = inserting(newValue, node: root)
    }
    
    public func getValuesInOrder() -> [Element] {
        
        return getValuesInOrder(node: root)
    }
    
    public func getValuesInLevelOrder() -> [Element] {
        
        guard let root = root else { return [] }
        
        var queue: [BinarySearchTreeNode<Element>] = [root]
        var result: [Element] = []
        
        while !queue.isEmpty {
            
            let current = queue.removeFirst()
            result.append(current.value)
            
            if let leftTree = current.left {
                queue.append(leftTree)
            }
            
            if let rightTree = current.right {
                queue.append(rightTree)
            }
            
        }
        
        return result
    }
}

private extension AVLTree {
    
    private func inserting(_ newValue: Element, node: BinarySearchTreeNode<Element>?) -> BinarySearchTreeNode<Element> {
        
        // Atomic case
        guard var node = node else {
            return BinarySearchTreeNode(newValue)
        }
        
        if newValue < node.value {
            node.left = inserting(newValue, node: node.left)
        } else {
            node.right = inserting(newValue, node: node.right)
        }
        
        let balance = getBalance(rootLeft: node.left, rootRight: node.right)
        
        if balance > 1 {
            
            if getHeight(for: node.right?.right) >= getHeight(for: node.right?.left) { // right-right - right heavy
                
                node = leftRotate(root: node)
            } else {
                
                node.right = rightRotate(root: node.right!)
                node = leftRotate(root: node)
            }
            
        } else if balance < -1 { // Left Left rotate - left heavy
            
            if getHeight(for: node.left?.left) >= getHeight(for: node.left?.right) {
                node = rightRotate(root: node)
            } else {
                node.left = leftRotate(root: node.left!)
                node = rightRotate(root: node)
            }
        } else {
            
            node.height = setHeight(for: node)
        }
        
        return node
    }
    
    private func getValuesInOrder(node: BinarySearchTreeNode<Element>?) -> [Element] {
        
        guard let node = node else { return [] }
        
        let lhs = getValuesInOrder(node: node.left)
        let rhs = getValuesInOrder(node: node.right)
        
        return lhs + [node.value] + rhs
    }
    
    /**
     - Summary:
     Left rotation: rotates a tree with the next form: - Time complexity O(1)
     root -> 1                2  <- new root
              \              / \
               2      ->    1   3
                \
                 3
     - Parameters:
     - root: the top tree root node
     - Returns: the new root node
     */
    func leftRotate(root: BinarySearchTreeNode<Element>) -> BinarySearchTreeNode<Element> {
        
        
        let newRoot = root.right!
        root.right = root.right?.left
        newRoot.left = root
        root.height = setHeight(for: root)
        newRoot.height = setHeight(for: newRoot)
        
        return newRoot
    }
    
    /**
     - Summary:
     Right rotate: rotates a tree with the next form: Time complexity O(1)
         3           2
        /           / \
       2     ->    1   3
      /
     1
     - Parameters:
     - root: the top root node
     - Returns: the new root node
     */
    func rightRotate(root: BinarySearchTreeNode<Element>) -> BinarySearchTreeNode<Element> {
        
        let newRoot = root.left!
        root.right = root.left?.right
        newRoot.right = root
        root.height = setHeight(for: root)
        newRoot.height = setHeight(for: newRoot)
        
        return newRoot
    }
}

// MARK: - Helpers
private extension AVLTree {
    
    private func setHeight(for root: BinarySearchTreeNode<Element>?) -> Int {
        
        guard let root = root else { return 0 }
        
        return max(root.left?.height ?? 0 , root.right?.height ?? 0) + 1
    }
    
    private func getHeight(for root: BinarySearchTreeNode<Element>?) -> Int {
        
        guard let root = root else { return 0 }
        
        return root.height
    }
    
    private func getBalance(rootLeft: BinarySearchTreeNode<Element>?, rootRight: BinarySearchTreeNode<Element>?) -> Int {
        
        return getHeight(for: rootRight) - getHeight(for: rootLeft)
    }
}

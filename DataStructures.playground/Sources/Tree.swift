import Foundation

/** Tree node */
public protocol TreeNode {
    associatedtype Element: Comparable
    var value: Element { get }
    var left: Self? { get set }
    var right: Self? { get set }
}
/************************/


/** Balanced Tree node */
public protocol BalancedTreeNode: TreeNode {
    
    var height: Int { get set }
}

/************************/


/**
 Tree
 */
public protocol Tree {
    associatedtype Element
    
    func insert(_ newValue: Element)
    func getValuesInOrder() -> [Element]
    func getValuesInLevelOrder() -> [Element]
}
/************************/

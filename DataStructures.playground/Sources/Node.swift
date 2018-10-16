import Foundation

public protocol Node {
    
    associatedtype Value
    
    var value: Value { get }
    var next: Self? { get set }
}

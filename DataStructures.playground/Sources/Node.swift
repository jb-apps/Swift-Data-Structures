import Foundation

public protocol Node {
    
    associatedtype Value
    
    var value: Value { get set }
    var next: Self? { get set }
}

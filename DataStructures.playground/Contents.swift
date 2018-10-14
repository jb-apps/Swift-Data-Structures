import UIKit

let tree = AVLTree<Int>()

for i in 1..<10 {

    tree.insert(i)
}

tree.insert(1)

print("Level order: \(tree.getValuesInLevelOrder())\n")

class Tree<node: Equatable> {
    var value: node
    var left: Tree?
    var right: Tree?
    
    init(_ value: node) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func search(_ neededNode: node) -> Tree? {
        if value == neededNode {
            return self
        }
    
        if let leftResult = left?.search(neededNode) {
            return leftResult
        }
        
        if let rightResult = right?.search(neededNode) {
            return rightResult
        }
        
        return nil
    }
}

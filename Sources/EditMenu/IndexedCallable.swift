import Foundation

/// Responds to selectors of the form `callWithIndex<int>` by invoking `handler` with the given `int`
class IndexedCallable: NSObject {
    static let prefix = "callWithIndex"
    private static let prefixLength = prefix.count
    
    static func selector(for index: Int) -> Selector {
        Selector("\(prefix)\(index)")
    }
    
    let handler: (Int) -> Void
    
    init(handler: @escaping (Int) -> Void) {
        self.handler = handler
    }
    
    class func willRespond(to selector: Selector) -> Bool {
        NSStringFromSelector(selector).hasPrefix(prefix)
    }
    
    override class func resolveInstanceMethod(_ selector: Selector!) -> Bool {
        let name = NSStringFromSelector(selector)

        // intercept unknown selectors of the form `callWithIndex<int>`
        guard name.hasPrefix(prefix), let index = Int(name.dropFirst(prefixLength)) else {
            return super.resolveInstanceMethod(selector)
        }
        
        // add a new method that calls the handler with the given index
        let imp: @convention(block) (IndexedCallable) -> Void = { instance in
            instance.handler(index)
        }
        
        // types "v@:" -> returns void (v), takes object (@) and selector (:)
        return class_addMethod(self, selector, imp_implementationWithBlock(imp), "v@:")
    }
}


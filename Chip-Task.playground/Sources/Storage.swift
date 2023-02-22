import Foundation

public class Storage {

    var array = [Chip]()
    private let lock = NSLock()

    public var count: Int {
        lock.lock()
        let value = array.count
        lock.unlock()
        return value
    }

    public init() {}

    public func push(newElement: Chip) {
        lock.lock()
        self.array.append(newElement)
        lock.unlock()
    }

    public func pop() -> Chip {
        lock.lock()
        let newValue = array.removeLast()
        lock.unlock()
        return newValue
    }
}


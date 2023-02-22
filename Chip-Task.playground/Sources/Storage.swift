import Foundation

public class Storage {
    var array = [Chip]()
    private let lock = NSLock()
    var isAvailable = false

    var isEmpty: Bool {
        array.isEmpty
    }

    var count: Int {
        lock.lock()
        let value = array.count
        lock.unlock()
        return value
    }

    public init() {}

    func push(newElement: Chip) {
        lock.lock()
        self.array.append(newElement)
        lock.unlock()
    }

    func pop() -> Chip {
        lock.lock()
        let newValue = array.removeLast()
        lock.unlock()
        return newValue
    }
}

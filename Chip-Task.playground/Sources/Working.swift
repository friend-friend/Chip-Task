import Foundation

class WorkingThread: Thread {

    private let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    override func main() {
        repeat {
            storage.pop().sodering()
            print("""
Микросхема припаяна! Микросхем в хранилище: \(storage.count)
""")
        } while storage.isEmpty || storage.isAvailable
    }
}

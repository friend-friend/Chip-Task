import Foundation

public class WorkingThread: Thread {

    private let storage: Storage

    public init(storage: Storage) {
        self.storage = storage
    }

    public override func main() {
        repeat {
            storage.pop().sodering()
            print("""
Микросхема припаяна! Микросхем в хранилище: \(storage.count)
""")
        } while storage.isEmpty || storage.isAvailable
    }
}

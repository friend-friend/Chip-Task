import Foundation

public class WorkingThread: Thread {

    private let storage: Storage

    public init(storage: Storage) {
        self.storage = storage
    }

    public override func main() {
        work()
    }

    private func work() {
        for _ in 1...10 {
            while (!GeneratingThread.boolPredicate) {
                GeneratingThread.condition.wait()
            }
            storage.pop().sodering()
            print("""
            \n
            Микросхема была припаяна! Микросхем в хранилище \(storage.count)
            """)
            if storage.count < 1 {
                GeneratingThread.boolPredicate = false
            }
        }
    }
}

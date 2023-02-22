import Foundation

public class GeneratingThread: Thread {

    static let condition = NSCondition()
    static var boolPredicate = false
    private let storage: Storage

    public init(storage: Storage) {
        self.storage = storage
    }

    public override func main() {
        make()
    }

    private func make() {
        for _ in 1...10 {
            GeneratingThread.condition.lock()
            storage.push(newElement: Chip.make())
            GeneratingThread.boolPredicate = true
            print("""
            \n
            Микросхема создана! Микросхем в хранилище: \(storage.count)
            """)
            GeneratingThread.condition.signal()
            GeneratingThread.condition.unlock()
            GeneratingThread.sleep(forTimeInterval: 2)
        }
    }
}

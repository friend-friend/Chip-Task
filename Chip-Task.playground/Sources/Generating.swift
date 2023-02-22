import Foundation

public class GeneratingThread: Thread {

    private let storage: Storage
    private var timer = Timer()

    public init(storage: Storage) {
        self.storage = storage
    }

    public override func main() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(getChip), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 20.0))
    }

    @objc func getChip() {
        storage.push(newElement: Chip.make())
    }
}

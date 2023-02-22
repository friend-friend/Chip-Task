import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let storage = Storage()
let generatingThread = GeneratingThread(storage: storage)
generatingThread.start()

let workingThread = WorkingThread(storage: storage)
workingThread.start()

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
`Logger` handles the logging of events during a CarPlay session.
*/

import Foundation

struct Event: Hashable {
    let date: Date!
    let text: String!
}

/**
 `Logger` describes an object that can receive interesting events from elsewhere in the app
 and persist them to memory, disk, a network connection, or elsewhere.
 */
protocol Logger {
    
    /// Append a new event to the log. The system adds all events at the 0 index.
    func appendEvent(_: String)
    
    /// Fetch the list of events that this logger receives.
    var events: [Event] { get }
}

/**
`LoggerDelegate` receives information about logging events.
 */
protocol LoggerDelegate: AnyObject {
    
    /// The logger receives a new event.
    func loggerDidAppendEvent()
}

/**
 `MemoryLogger` is a type of `Logger` that records events in-memory for the current life cycle of the app.
 */
class MemoryLogger: Logger {
    
    static let shared = MemoryLogger()
    
    weak var delegate: LoggerDelegate?
    
    public private(set) var events: [Event]
    
    private let loggingQueue: OperationQueue
    
    private init() {
        events = []
        loggingQueue = OperationQueue()
        loggingQueue.maxConcurrentOperationCount = 1
        loggingQueue.name = "Memory Logger Queue"
        loggingQueue.qualityOfService = .userInitiated
    }
    
    func appendEvent(_ event: String) {
        loggingQueue.addOperation {
            self.events.insert(Event(date: Date(), text: event), at: 0)
            
            guard let delegate = self.delegate else { return }
            
            DispatchQueue.main.async {
                delegate.loggerDidAppendEvent()
            }
        }
    }
}

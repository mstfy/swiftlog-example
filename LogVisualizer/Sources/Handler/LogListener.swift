
protocol LogListenerDelegate: class {
    func handle(log: VisualLog)
}

class LogListener {
    private init() {}
    static let shared = LogListener()

    weak var delegate: LogListenerDelegate?

    func send(newLog: VisualLog) {
        delegate?.handle(log: newLog)
    }
}

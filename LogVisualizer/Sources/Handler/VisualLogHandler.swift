
import Logging

public struct VisualLogHandler: LogHandler {
    let listener = LogListener.shared

    public init() {}

    public var logLevel: Logger.Level = .debug
    public var metadata: Logger.Metadata = [:]

    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get {
            return metadata[key]
        }
        set {
            metadata[key] = newValue
        }
    }

    public func log(
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata?,
        file: String,
        function: String,
        line: UInt
    ) {
        var parameters = self.metadata
        if let metadata = metadata {
            parameters.merge(metadata, uniquingKeysWith: { (_, new) in new })
        }
        parameters["file"] = "\(file)"
        parameters["line"] = "\(line)"

        let log = VisualLog(
            message: message.description,
            level: level,
            parameters: parameters.map { ($0.key, $0.value.description) }
        )

        listener.send(newLog: log)
    }
}

struct VisualLog {
    let message: String
    let level: Logger.Level
    let parameters: [(String, String)]
}

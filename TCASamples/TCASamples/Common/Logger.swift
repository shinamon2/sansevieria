//
//  Logger.swift
//
//  Created by shina on 2023/11/10.
//

import Foundation
import os

public enum LogLevel: Int, CustomStringConvertible {
    case trace
    case debug
    case info
    case warning
    case error
    case critical

    public var description: String {
        switch self {
        case .trace:
            "📝 [TRACE]"
        case .debug:
            "🐛 [DEBUG]"
        case .info:
            "ℹ️ [INFO]"
        case .warning:
            "⚠️ [WARN]"
        case .error:
            "❌ [ERROR]"
        case .critical:
            "☠️ [CRITICAL]"
        }
    }

    var logType: OSLogType {
        switch self {
        case .trace:
            .default
        case .debug:
            .debug
        case .info:
            .info
        case .warning:
            .debug
        case .error:
            .error
        case .critical:
            .fault
        }
    }
}

public class Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "TCASample"
    public static var shared = Logger(subsystem: subsystem, category: "")
    private let osLogger: OSLog

    static func createInstance(subsystem: String? = Logger.subsystem, category: String) {
        shared = Logger(subsystem: subsystem ?? Logger.subsystem, category: category)
    }

    private init(subsystem: String, category: String) {
        osLogger = OSLog(subsystem: subsystem, category: category)
    }

    // 通常のログ出力
    public func log(message: String) {
        os_log("%@", log: osLogger, type: .debug, message)
    }

    /// フォーマット付きのログ
    public func log(level: LogLevel, format: StaticString, _ args: CVarArg...) {
        os_log(format, log: .default, type: level.logType, args)
    }

    /// マルチバイト文字用 フォーマット付きのログ ※注意：publicで表示されても良いログのみ使用すること
    public func log(level: LogLevel, key: String, _ args: CVarArg...) {
        let localizedFormat = NSLocalizedString(key, comment: "")
        let formattedMessage: String = if !args.isEmpty {
            String(format: localizedFormat, locale: Locale.current, arguments: args)
        } else {
            localizedFormat
        }
        os_log("%{private}@", log: .default, type: level.logType, formattedMessage)
    }
}

#if DEBUG
    public let logger = LoggerExtension(minLevel: .trace)
#else
    public let logger = LoggerExtension(minLevel: .info)
#endif

public final class LoggerExtension {
    let minLevel: LogLevel

    var threadName: String {
        if Thread.isMainThread {
            "mainThread"
        } else if let threadName = Thread.current.name, !threadName.isEmpty {
            threadName
        } else {
            String(format: "%p", Thread.current)
        }
    }

    public init(minLevel: LogLevel = .info) {
        self.minLevel = minLevel
    }

    func logging(level: LogLevel, message: String, category: String?) {
        if minLevel.rawValue <= level.rawValue {
            if let category {
                Logger.createInstance(category: category)
                Logger.shared.log(message: message)
            } else {
                os_log("%@", log: .default, type: level.logType, message)
            }
        }
    }

    public func trace(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.trace
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    public func debug(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.debug
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    public func info(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.info
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    public func warning(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.warning
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    public func error(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.error
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    public func critical(_ message: @autoclosure () -> Any, functionName: String = #function, category: String? = nil) {
        let level = LogLevel.critical
        let message = makeMessage(level: level, message: "\(message())", functionName: functionName)
        logging(level: level, message: message, category: category)
    }

    func makeMessage(level: LogLevel, message: String, functionName: String) -> String {
        "\(level.description) [\(threadName)] [\(functionName)] \(message)"
    }
}

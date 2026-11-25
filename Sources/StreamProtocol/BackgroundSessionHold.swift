import Foundation

/// Per-connection hold, measured by the host's continuous clock (including system sleep).
public struct BackgroundSessionHold {
    public static let minutes = [1, 3, 5, 10]
    public static let defaultMinutes = 3
    public static let expiryNotice = Goodbye(reason: "backgroundExpired",
                                            message: "The background session expired. Tap your Mac to reconnect.",
                                            reconnect: false)
    public enum Change { case unchanged, parked, resumed, expired }

    private var deadline: ContinuousClock.Instant?
    public init() {}
    public var parked: Bool { deadline != nil }

    public func expired(at now: ContinuousClock.Instant) -> Bool {
        deadline.map { now >= $0 } ?? false
    }

    /// One byte, in minutes. Zero resumes. Duplicate requests keep the original deadline.
    public mutating func receive(_ payload: Data, at now: ContinuousClock.Instant) -> Change {
        if expired(at: now) { return .expired }
        guard payload.count == 1, let byte = payload.first else { return .unchanged }
        if byte == 0 {
            guard parked else { return .unchanged }
            deadline = nil
            return .resumed
        }
        let value = Int(byte)
        guard !parked, Self.minutes.contains(value) else { return .unchanged }
        deadline = now.advanced(by: .seconds(value * 60))
        return .parked
    }
}

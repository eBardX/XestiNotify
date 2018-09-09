//
//  LockScreenMonitor.swift
//  XestiNotifyDemo-iOS
//
//  Created by J. G. Pusey on 2018-08-26.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import XestiMonitors
import XestiNotify

public class LockScreenMonitor: BaseMonitor {

    // MARK: Public Nested Types

    public enum Event {
        case statusDidChange(Status)
    }

    public enum Status {    // or LockStatus
        case locked
        case unknown
        case unlocked
    }

    // MARK: Public Initializers

    public init(queue: OperationQueue = .main,
                handler: @escaping (Event) -> Void) {
        self.handler = handler
        self.innerQueue = .main
        self.queue = queue

        super.init()
    }

    // MARK: Public Instance Properties

    public var status: Status {
        if let registration = self.registration {
            return registration.state != 0 ? .locked : .unlocked
        } else {
            return .unknown
        }
    }

    // MARK: Private Instance Properties

    private let handler: (Event) -> Void
    private let innerQueue: DispatchQueue
    private let queue: OperationQueue

    private var registration: Registration?

    // MARK: Overridden BaseMonitor Methods

    override public func cleanupMonitor() {
        registration = nil

        super.cleanupMonitor()
    }

    override public func configureMonitor() {
        super.configureMonitor()

        registration = try? QueueRegistration(name: "com.apple.springboard.lockstate",
                                              queue: innerQueue) { [weak self] in
                                                self?.handler(.statusDidChange(self?.status ?? .unknown))
        }
    }
}

//
//  Registration.swift
//  XestiNotify
//
//  Created by J. G. Pusey on 2018-08-25.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import Cnotify

///
///
///
public class Registration {
    ///
    ///
    ///
    public enum Error: Swift.Error {
        case failed
        case invalidFile
        case invalidName
        case invalidPort
        case invalidRequest
        case invalidSignal
        case invalidToken
        case notAuthorized
    }

    ///
    ///
    ///
    public static func post(name: String) throws {
        try checkStatus(notify_post(name))
    }

    ///
    ///
    ///
    public let name: String

    ///
    ///
    ///
    public var state: UInt64 {
        get { return getState() }
        set { setState(newValue) }
    }

    ///
    ///
    ///
    public func resume() throws {
        try Registration.checkStatus(notify_resume(token))
    }

    ///
    ///
    ///
    public func suspend() throws {
        try Registration.checkStatus(notify_suspend(token))
    }

    internal static func checkStatus(_ status: UInt32) throws {
        switch status {
        case UInt32(NOTIFY_STATUS_INVALID_FILE):
            throw Error.invalidFile

        case UInt32(NOTIFY_STATUS_INVALID_NAME):
            throw Error.invalidName

        case UInt32(NOTIFY_STATUS_INVALID_PORT):
            throw Error.invalidPort

        case UInt32(NOTIFY_STATUS_INVALID_REQUEST):
            throw Error.invalidRequest

        case UInt32(NOTIFY_STATUS_INVALID_SIGNAL):
            throw Error.invalidSignal

        case UInt32(NOTIFY_STATUS_INVALID_TOKEN):
            throw Error.invalidToken

        case UInt32(NOTIFY_STATUS_NOT_AUTHORIZED):
            throw Error.notAuthorized

        default:
            throw Error.failed
        }
    }

    internal init(name: String,
                  token: Int32) {
        self.name = name
        self.token = token
    }

    internal let token: Int32

    private func getState() -> UInt64 {
        var tmpState: UInt64 = 0

        notify_get_state(token, &tmpState)

        return tmpState
    }

    private func setState(_ state: UInt64) {
        notify_set_state(token, state)
    }

    deinit {
        if notify_is_valid_token(token) {
            notify_cancel(token)
        }
    }
}

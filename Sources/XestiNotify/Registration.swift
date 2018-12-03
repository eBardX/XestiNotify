// © 2018 J. G. Pusey (see LICENSE.md)

import DarwinNotify

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
    public let name: String

    ///
    ///
    ///
    public func getState() throws -> UInt64 {
        var tmpState: UInt64 = 0

        try checkStatus(notify_get_state(token, &tmpState))

        return tmpState
    }

    ///
    ///
    ///
    public func post() throws {
        try checkStatus(notify_post(name))
    }

    ///
    ///
    ///
    public func postState(_ state: UInt64) throws {
        var status = notify_set_state(token, state)

        if status == NOTIFY_STATUS_OK {
            status = notify_post(name)
        }

        try checkStatus(status)
    }

    ///
    ///
    ///
    public func resume() throws {
        try checkStatus(notify_resume(token))
    }

    ///
    ///
    ///
    public func setState(_ state: UInt64) throws {
        try checkStatus(notify_set_state(token, state))
    }

    ///
    ///
    ///
    public func suspend() throws {
        try checkStatus(notify_suspend(token))
    }

    internal init(name: String,
                  token: Int32) {
        self.name = name
        self.token = token
    }

    internal let token: Int32

    internal func checkStatus(_ status: UInt32) throws {
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

        case UInt32(NOTIFY_STATUS_OK):
            break

        default:
            throw Error.failed
        }
    }

    deinit {
        if notify_is_valid_token(token) {
            notify_cancel(token)
        }
    }
}

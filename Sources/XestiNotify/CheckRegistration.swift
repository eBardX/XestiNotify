// © 2018 J. G. Pusey (see LICENSE.md)

import DarwinNotify

///
///
///
public class CheckRegistration: Registration {
    ///
    ///
    ///
    public init(name: String) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID

        let status = notify_register_check(name,
                                           &tmpToken)

        super.init(name: name,
                   token: tmpToken)

        try checkStatus(status)
    }

    ///
    ///
    ///
    public func check() throws -> Bool {
        var tmpCheck: Int32 = 0

        try checkStatus(notify_check(token, &tmpCheck))

        return tmpCheck != 0
    }
}

//
//  CheckRegistration.swift
//  XestiNotify
//
//  Created by J. G. Pusey on 2018-08-26.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import Cnotify

///
///
///
public class CheckRegistration: Registration {
    ///
    ///
    ///
    public init(name: String) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID

        try Registration.checkStatus(notify_register_check(name,
                                                           &tmpToken))

        super.init(name: name,
                   token: tmpToken)
    }

    //
    //
    //
    public func check() throws -> Bool {
        var tmpCheck: Int32 = 0

        try Registration.checkStatus(notify_check(token, &tmpCheck))

        return tmpCheck != 0
    }
}

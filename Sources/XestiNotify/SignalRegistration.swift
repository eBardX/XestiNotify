//
//  SignalRegistration.swift
//  XestiNotify
//
//  Created by J. G. Pusey on 2018-08-26.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import DarwinNotify

///
///
///
public class SignalRegistration: Registration {
    ///
    ///
    ///
    public init(name: String,
                signal: Int32) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID

        let status = notify_register_signal(name,
                                            signal,
                                            &tmpToken)

        super.init(name: name,
                   token: tmpToken)

        try checkStatus(status)
    }
}

//
//  QueueRegistration.swift
//  XestiNotify
//
//  Created by J. G. Pusey on 2018-08-25.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import DarwinNotify

///
///
///
public class QueueRegistration: Registration {
    ///
    ///
    ///
    public init(name: String,
                queue: DispatchQueue = .main,
                handler: @escaping () -> Void) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID

        let status = notify_register_dispatch(name,
                                              &tmpToken,
                                              queue) {
                                                if tmpToken == $0 {
                                                    handler()
                                                }
        }

        super.init(name: name,
                   token: tmpToken)

        try checkStatus(status)
    }
}

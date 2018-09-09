//
//  PortRegistration.swift
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
public class PortRegistration: Registration {
    ///
    ///
    ///
    public init(name: String,
                machPort: mach_port_t = 0) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID
        var tmpPort: mach_port_t
        var tmpFlags: Int32

        if machPort != 0 {
            tmpPort = machPort
            tmpFlags = NOTIFY_REUSE
        } else {
            tmpPort = 0
            tmpFlags = 0
        }

        try Registration.checkStatus(notify_register_mach_port(name,
                                                               &tmpPort,
                                                               tmpFlags,
                                                               &tmpToken))

        self.machPort = tmpPort

        super.init(name: name,
                   token: tmpToken)
    }

    ///
    ///
    ///
    public let machPort: mach_port_t
}

// © 2018 J. G. Pusey (see LICENSE.md)

import DarwinNotify

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

        let status = notify_register_mach_port(name,
                                               &tmpPort,
                                               tmpFlags,
                                               &tmpToken)

        self.machPort = tmpPort

        super.init(name: name,
                   token: tmpToken)

        try checkStatus(status)
    }

    ///
    ///
    ///
    public let machPort: mach_port_t
}

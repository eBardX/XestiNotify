// © 2018 J. G. Pusey (see LICENSE.md)

import DarwinNotify

///
///
///
public class FileRegistration: Registration {
    ///
    ///
    ///
    public init(name: String,
                fileDescriptor: Int32 = -1) throws {
        var tmpToken: Int32 = NOTIFY_TOKEN_INVALID
        var tmpFlags: Int32
        var tmpFD: Int32

        if fileDescriptor >= 0 {
            tmpFD = fileDescriptor
            tmpFlags = NOTIFY_REUSE
        } else {
            tmpFD = 0
            tmpFlags = 0
        }

        let status = notify_register_file_descriptor(name,
                                                     &tmpFD,
                                                     tmpFlags,
                                                     &tmpToken)

        self.fileDescriptor = tmpFD

        super.init(name: name,
                   token: tmpToken)

        try checkStatus(status)
    }

    //
    //
    //
    public let fileDescriptor: Int32
}

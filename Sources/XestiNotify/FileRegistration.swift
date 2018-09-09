//
//  FileRegistration.swift
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

        try Registration.checkStatus(notify_register_file_descriptor(name,
                                                                     &tmpFD,
                                                                     tmpFlags,
                                                                     &tmpToken))

        self.fileDescriptor = tmpFD

        super.init(name: name,
                   token: tmpToken)
    }

    //
    //
    //
    public let fileDescriptor: Int32
}

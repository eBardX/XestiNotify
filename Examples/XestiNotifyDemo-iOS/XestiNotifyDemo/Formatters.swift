//
//  Formatters.swift
//  XestiNotifyDemo-iOS
//
//  Created by J. G. Pusey on 2018-08-29.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import XestiNotify

public func formatStatus(_ value: XestiNotify.Status) -> String {
    switch value {
    case .locked:
        return "Locked"

    case .unknown:
        return "Unknown"

    case .unlocked:
        return "Unlocked"
    }
}

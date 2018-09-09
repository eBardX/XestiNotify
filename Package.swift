// swift-tools-version:4.0

//
//  Package.swift
//  XestiNotify
//
//  Created by J. G. Pusey on 2018-09-09.
//
//  © 2018 J. G. Pusey (see LICENSE.md)
//

import PackageDescription

let package = Package(name: "XestiNotify",
                      products: [.library(name: "XestiNotify",
                                          targets: ["XestiNotify"])],
                      targets: [.target(name: "Cnotify",
                                        dependencies: []),
                                .target(name: "XestiNotify",
                                        dependencies: ["Cnotify"])],
                      swiftLanguageVersions: [4])

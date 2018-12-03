// swift-tools-version:4.2

// © 2018 J. G. Pusey (see LICENSE.md)

import PackageDescription

let package = Package(name: "XestiNotify",
                      products: [.library(name: "XestiNotify",
                                          targets: ["XestiNotify"])],
                      targets: [.target(name: "DarwinNotify",
                                        dependencies: []),
                                .target(name: "XestiNotify",
                                        dependencies: ["DarwinNotify"])],
                      swiftLanguageVersions: [4])

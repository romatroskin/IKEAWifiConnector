// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IKEAWifiConnectorSPM",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "IKEAWifiConnectorSPM",
            targets: ["IKEAWifiConnectorSPMTarget"]),
    ],
    targets: [
        .target(
            name: "IKEAWifiConnectorSPMTarget",
            dependencies: [.target(name: "IKEAWifiConnectorSPMWrapper",
                                   condition: .when(platforms: [.iOS]))],
            path: "SwiftPM-PlatformExclude/IKEAWifiConnectorSPMWrap"),
        .target(name: "IKEAWifiConnectorSPMWrapper",
                dependencies: [.target(name: "IKEAWifiConnectorSPM", condition: .when(platforms: [.iOS])),
                               .target(name: "Alamofire", condition: .when(platforms: [.iOS])),
                               .target(name: "RxSwift", condition: .when(platforms: [.iOS]))
                ],
                path: "IKEAWifiConnectorSPMWrapper"),
        .binaryTarget(
            name: "IKEAWifiConnectorSPM",
            url: "https://github.com/romatroskin/IKEAWifiConnector/releases/download/0.0.1/IKEAWifiConnectorSPM.zip",
            checksum: "03d3d83168089733089da69a8e3283a8441a05237999653ebf78c34f2cde09b7"),
        .binaryTarget(
            name: "Alamofire",
            url: "https://github.com/romatroskin/IKEAWifiConnector/releases/download/0.0.1/Alamofire-5.4.0.zip",
            checksum: "848ebcd108a17b695846a4a2e04c1bcf615932c1b2b8d7509be920d785f676fc"),
        .binaryTarget(
            name: "RxSwift",
            url: "https://github.com/romatroskin/IKEAWifiConnector/releases/download/0.0.1/RxSwift-6.0.0-rc.2.zip",
            checksum: "235cd9aa859c1fd80d8f37ddfa857916f558d2467f5aa66ae0afcc9096c35740"),
    ])

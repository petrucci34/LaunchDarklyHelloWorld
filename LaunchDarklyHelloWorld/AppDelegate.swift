//
//  AppDelegate.swift
//  LaunchDarklyHelloWorld
//
//  Created by Korhan Bircan on 3/24/17.
//  Copyright © 2017 Korhan Bircan. All rights reserved.
//

import UIKit
import LaunchDarkly

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let mobileKeyTest = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    private func setUpLDClient() {
        let configBuilder = LDConfigBuilder()
        configBuilder.withMobileKey(mobileKeyTest)
        let userBuilder = LDUserBuilder()
        _ = userBuilder.withKey("test@email.com")
        LDClient.sharedInstance().start(configBuilder, userBuilder: userBuilder)
    }
}

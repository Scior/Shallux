//
//  main.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/20.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

var appDelegateName: String {
    if ProcessInfo.processInfo.environment["isUnitTest"] != nil {
        return NSStringFromClass(TestAppDelegate.self)
    } else {
        return NSStringFromClass(AppDelegate.self)
    }
}

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutablePointer(CommandLine.unsafeArgv),
    NSStringFromClass(UIApplication.self),
    appDelegateName)

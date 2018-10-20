//
//  AppDelegate.swift
//  Shallux
//
//  Created by Suita Fujino on 2018/10/08.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window.rootViewController = storyboard.instantiateInitialViewController()
        window.makeKeyAndVisible()
        
        return true
    }

}

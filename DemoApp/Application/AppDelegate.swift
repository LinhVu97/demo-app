//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appView = AppView()
        window.rootViewController = UIHostingController(rootView: appView)
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}


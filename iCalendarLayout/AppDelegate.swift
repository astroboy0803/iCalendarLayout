//
//  AppDelegate.swift
//  iCalendarLayout
//
//  Created by i9400506 on 2021/9/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StickyCollectionViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}


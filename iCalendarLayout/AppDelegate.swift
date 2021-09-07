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
        
        debugPrint(CGRect(x: 32, y: 50, width: 80, height: 70))
        debugPrint(CGRect(x: 32, y: 50, width: 80, height: 70).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32.5, y: 50.2, width: 80, height: 70))
        debugPrint(CGRect(x: 32.5, y: 50.2, width: 80, height: 70).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32, y: 50, width: 80.3, height: 70.5))
        debugPrint(CGRect(x: 32, y: 50, width: 80.3, height: 70.5).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32.1, y: 50.1, width: 80.1, height: 70.1))
        debugPrint(CGRect(x: 32.1, y: 50.1, width: 80.1, height: 70.1).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32.5, y: 50.1, width: 80.1, height: 70.1))
        debugPrint(CGRect(x: 32.5, y: 50.1, width: 80.1, height: 70.1).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32.5, y: 50.5, width: 80.6, height: 70.6))
        debugPrint(CGRect(x: 32.5, y: 50.5, width: 80.6, height: 70.6).integral)
        debugPrint("========")
        
        debugPrint(CGRect(x: 32.5, y: 50.5, width: 80.5, height: 70.5))
        debugPrint(CGRect(x: 32.5, y: 50.5, width: 80.5, height: 70.5).integral)
        debugPrint("========")
        
        return true
    }
}


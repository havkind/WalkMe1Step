//
//  AppDelegate.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NotificationManager.shared.requestPermission()
        
        return true
    }
}

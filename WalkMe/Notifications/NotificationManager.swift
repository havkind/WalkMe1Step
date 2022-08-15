//
//  NotificationManager.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import Foundation
import UserNotifications

struct NotificationManager{
    static let shared = NotificationManager()
    private init(){}
    
    func requestPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func showNotification(title: String, subTitle: String){
        print("show Notif - \(subTitle)")
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

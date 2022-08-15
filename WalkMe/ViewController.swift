//
//  ViewController.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import UIKit
import Combine

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    @IBOutlet weak var statusLabel: UILabel!
    var walkingRecordingSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walkingRecordingSubscriber = WalkBgManager.shared.statusChangedPublisher.sink{ value in
            DispatchQueue.main.async {
                self.statusLabel.text = value
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        walkingRecordingSubscriber?.cancel()
        walkingRecordingSubscriber = nil
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }

}


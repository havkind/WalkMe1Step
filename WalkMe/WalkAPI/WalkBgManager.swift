//
//  WalkBgManager.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import Foundation
import CoreMotion
import Combine

class WalkBgManager{
    static let shared = WalkBgManager()
    private init(){}
    private lazy var _motionActivityManager = CMMotionActivityManager()
    private lazy var recorderMock = WalkRecorder()
    private var isRecording = false
    let statusChangedPublisher = CurrentValueSubject<String, Never>("Hello Nir...")
    
    func monitorBackroundWalks(enabled: Bool){
        if enabled {
            startMonitoring()
        } else{
            self.recorderMock.stop()
            _motionActivityManager.stopActivityUpdates()
            isRecording = false
        }
    }
    
    fileprivate func startMonitoring() {
        _motionActivityManager.startActivityUpdates(to: .main){ activity in
            if activity?.walking ?? false && !self.isRecording {
                self.statusChangedPublisher.value = "recording..."
                self.isRecording = true
                NotificationManager.shared.showNotification(title: "WalkMe1Step", subTitle: "Recording started")
                self.recorderMock.start(durationToRecord: 20) {  NotificationManager.shared.showNotification(title: "WalkMe1Step", subTitle: "Recording stopped")
                    self.isRecording = false
                    self.statusChangedPublisher.value = "recording stopped..."
                }
            }
        }
    }
}

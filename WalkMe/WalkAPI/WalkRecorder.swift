//
//  WalkRecorder.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import Foundation

class WalkRecorder{
    private var completionBlock: (()->())?
    private var timer: Timer?
    
    @objc func onEndRecording() {
        self.completionBlock?()
    }
    
    func start(durationToRecord: Double, completion: (()->())?){
        self.completionBlock = completion
        
        //recording should start here...
        
        timer = Timer.scheduledTimer(timeInterval: durationToRecord,
            target: self,
            selector: #selector(onEndRecording),
            userInfo: nil,
            repeats: false)
    }
    
    func stop(){
        timer?.invalidate()
        self.completionBlock?()
    }
}

//
//  ViewController.swift
//  DesafioChicote
//
//  Created by Luís Resende on 04/04/16.
//  Copyright © 2016 Luís Resende. All rights reserved.
//

import UIKit
import WatchConnectivity
import AVFoundation

class ViewController: UIViewController, WCSessionDelegate {
    
    var session: WCSession?
    var countWhipe = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            
            self.session = WCSession.defaultSession()
            self.session?.delegate = self
            self.session?.activateSession()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        
        
        return true
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        switch (motion) {
            
        case .MotionShake:
            
            self.incrementShakeCount()
            self.session?.transferUserInfo(["Whip" : "CHICOTADAS: \(self.countWhipe)"])
            self.playSound()
        
        default:
            print ("Default")
        
        }
        
    }
    
    func incrementShakeCount () {
        self.countWhipe += 1
    }
    
    func playSound () {
        
        switch arc4random() % 4 {
        case 1:
            
            if let url = NSBundle.mainBundle().URLForResource("sound 1", withExtension: "wav") {
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(url, &mySound)
                AudioServicesPlaySystemSound(mySound)
            }
           
        case 2:
            
            if let url = NSBundle.mainBundle().URLForResource("sound 2", withExtension: "wav") {
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(url, &mySound)
                AudioServicesPlaySystemSound(mySound)
            }

        case 3:
            
            if let url = NSBundle.mainBundle().URLForResource("sound 3", withExtension: "wav") {
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(url, &mySound)
                AudioServicesPlaySystemSound(mySound)
            }
            
        default:
            
            if let url = NSBundle.mainBundle().URLForResource("sound 1", withExtension: "wav") {
                var mySound: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(url, &mySound)
                AudioServicesPlaySystemSound(mySound)
            }

        }
    }
}


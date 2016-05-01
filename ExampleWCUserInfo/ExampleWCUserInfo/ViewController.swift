//
//  ViewController.swift
//  ExampleWCUserInfo
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()){
            
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            session.transferUserInfo(["hello" : "userInfo chegou!!!"])
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


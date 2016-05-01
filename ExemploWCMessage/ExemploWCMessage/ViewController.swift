//
//  ViewController.swift
//  ExemploWCMessage
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate{

    @IBOutlet weak var resultCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var session:WCSession!
        
        if (WCSession.isSupported()){
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        let counter = message["counter"] as! String
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.resultCounter.text = counter
        }
    }

}


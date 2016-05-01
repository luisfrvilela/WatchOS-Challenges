//
//  ViewController.swift
//  ExampleWCContext
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()){
            
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let name = applicationContext["dict"] as! String
        self.label.text = name
    }


}


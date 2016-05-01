//
//  InterfaceController.swift
//  ExemploWCMessage WatchKit Extension
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate{

    @IBOutlet var label: WKInterfaceLabel!
    
    var counter = 0
    
    var session:WCSession!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if (WCSession.isSupported()){
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
    @IBAction func increment() {
        counter += 1
        actualizeLabel()
    }
    
    @IBAction func clean() {
        counter = 0
        actualizeLabel()
    }
    
    @IBAction func transfer() {
        
        let dictionary = ["counter":String(counter)]
        
        session.sendMessage(dictionary, replyHandler: { (dict: [String : AnyObject]) in
            
            }) { (NSError) in
                
        }
    }
    
    func actualizeLabel () {
        label.setText(String(counter))
    }

}

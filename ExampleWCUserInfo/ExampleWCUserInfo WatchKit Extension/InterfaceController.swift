//
//  InterfaceController.swift
//  ExampleWCUserInfo WatchKit Extension
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet var userInfoLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if (WCSession.isSupported()){
            
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
        }
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        
        self.userInfoLabel.setText(userInfo["hello"] as? String)
        
    }
}

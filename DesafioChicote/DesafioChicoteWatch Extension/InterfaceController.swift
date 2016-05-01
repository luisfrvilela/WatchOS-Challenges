//
//  InterfaceController.swift
//  DesafioChicoteWatch Extension
//
//  Created by Luís Resende on 04/04/16.
//  Copyright © 2016 Luís Resende. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {
    

    @IBOutlet var whipLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if WCSession.isSupported() {
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
        let whipes = (userInfo["Whip"] as! String)
        self.whipLabel.setText(whipes)
        
    }

    
}

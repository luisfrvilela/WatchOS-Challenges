//
//  InterfaceController.swift
//  ExampleWCContext WatchKit Extension
//
//  Created by Luís Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

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
    
    @IBAction func buttonPerius() {
        names("Perius")        
    }
    
    @IBAction func buttonJacome() {
        names("Jacome")
    }
    
    @IBAction func buttonHuallyd() {
        names("Huallyd")
    }
    
    func names (name:String){

        do{
            let dictionary = ["dict":name]
            try session.updateApplicationContext(dictionary)
        }catch{
            print("Erro: \(error)")
        }
    
    }

}

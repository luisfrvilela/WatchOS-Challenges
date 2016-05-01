//
//  InterfaceController.swift
//  DesafioWatchConectivy WatchKit Extension
//
//  Created by Luis Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    var session:WCSession!
    var dictionaryMessages = NSMutableDictionary()
    var arrayMessages = NSMutableArray()
    var index : NSInteger = 0
    
    
    @IBOutlet var lblMessage: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        if (WCSession.isSupported()){
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
          
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        let messageString = message["dicionario"] as! String
        
        self.arrayMessages.addObject(messageString)
        self.dictionaryMessages.setObject(UIColor.whiteColor(), forKey: self.index)
        self.index = self.index + 1
        self.updateDataTable()
    }
    
    func updateDataTable(){
        
        self.tableView.setNumberOfRows(self.arrayMessages.count, withRowType:"messageRow")
        for var i = 0; i<self.tableView.numberOfRows; i++ {
            let row = self.tableView.rowControllerAtIndex(i) as! RowController
            row.lblMessage.setText(self.arrayMessages.objectAtIndex(i) as? String)
            row.group.setBackgroundColor(self.dictionaryMessages.objectForKey(i) as? UIColor)
            
        }
    }

    @IBAction func newMessage() {
         let options = ["Hello", "tudo bem?"]
        presentTextInputControllerWithSuggestions(options, allowedInputMode:.AllowEmoji) { (result) -> Void in
            if result != nil && result?.count > 0{
                if let myResult = result!.first as? String{
                    
                    self.arrayMessages.addObject(myResult)
                    self.dictionaryMessages.setObject(UIColor.greenColor(), forKey: self.index)
                    self.index = self.index + 1
                    self.updateDataTable()
                    
                    dispatch_async(dispatch_get_main_queue()){
                        let dicionario  = ["dicionario":myResult]
                        self.session.sendMessage(dicionario, replyHandler: { (dict:[String:AnyObject]) in
                            }) { (NSError)in
                                //
                        }
                    }
                  
                }
                
            }
        }

    }
  
   

}

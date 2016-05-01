//
//  InterfaceController.swift
//  TapticExample WatchKit Extension
//
//  Created by Luís Resende on 22/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation

internal let arrayTypeTaptic = [(WKHapticType.Click, "Click"), (WKHapticType.DirectionDown, "DirectionDown"), (WKHapticType.DirectionUp,"DirectionUp"), (WKHapticType.Failure,"Failure"), (WKHapticType.Notification, "Notification"), (WKHapticType.Retry, "Retry"), (WKHapticType.Start,"Start"), (WKHapticType.Stop, "Stop"), (WKHapticType.Success,"Success")]

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.table.setNumberOfRows(arrayTypeTaptic.count, withRowType: "row")
        
        
        for index in 0...arrayTypeTaptic.count-1 {
            
            let row = self.table.rowControllerAtIndex(index) as! RowController
            row.label.setText("\(arrayTypeTaptic[index].1)")
        }
        

        
        // Configure interface objects here.
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        WKInterfaceDevice.currentDevice().playHaptic(arrayTypeTaptic[rowIndex].0)
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        let handoff = Handoff()
        let userInfo:[NSObject:AnyObject] = [handoff.activityValueKey:""]
        updateUserActivity(Handoff.ActivityType.Detail.rawValue, userInfo: userInfo, webpageURL: nil)
    }

}

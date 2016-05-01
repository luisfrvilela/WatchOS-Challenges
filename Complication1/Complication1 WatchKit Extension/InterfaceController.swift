//
//  InterfaceController.swift
//  Complication1 WatchKit Extension
//
//  Created by Luís Resende on 07/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation

internal let activities = ["Jogar bola na praia","Tomar uns drinks","Surfar na marola", "Dançar"]

class InterfaceController: WKInterfaceController {

    @IBOutlet var tableActivities: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.resetActivity()
        self.configureTable()
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
    
    func resetActivity(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let _ = userDefaults.objectForKey("firstTime") {
            
        }else{
            userDefaults.setBool(false, forKey: "firstTime")
            for i in 0...activities.count{
                userDefaults.setBool(false, forKey: "activity\(i)")
            }
            userDefaults.synchronize()
        }
        
    }

    func configureTable(){
        self.tableActivities.setNumberOfRows(activities.count, withRowType: "row")
        
        for (index,activity) in activities.enumerate() {
            let row = self.tableActivities.rowControllerAtIndex(index) as! RowController
            row.labelActivity.setText(activity)
            row.imageCheck.setImage(UIImage(named: "icon.png"))
            
            let activityDone = ComplicationUtil.isActivityDone(index)
            row.imageCheck.setHidden(Bool(1 - Int(activityDone)))
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = self.tableActivities.rowControllerAtIndex(rowIndex) as! RowController
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let activityDone = ComplicationUtil.isActivityDone(rowIndex)
        
        userDefaults.setBool(Bool(1 - Int(activityDone)), forKey: "activity\(rowIndex)")
        row.imageCheck.setHidden(activityDone)
        
//        
//        if activityDone == true {
//            userDefaults.setBool(false, forKey: "activity\(rowIndex)")
//            row.imageCheck.setHidden(true)
//        }else{
//            userDefaults.setBool(true, forKey: "activity\(rowIndex)")
//            row.imageCheck.setHidden(false)
//        }
        userDefaults.synchronize()
    }
    
    
}

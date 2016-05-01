//
//  GlanceInterfaceController.swift
//  DesafioMochileiro
//
//  Created by Luís Resende on 06/04/16.
//  Copyright © 2016 Luís Resende. All rights reserved.
//

import WatchKit
import Foundation


class GlanceInterfaceController: WKInterfaceController {

    @IBOutlet var nameCountry: WKInterfaceLabel!
    @IBOutlet var localizationCountry: WKInterfaceLabel!
    @IBOutlet var imageFlag: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.startInterface()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func startInterface(){
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dictFlag = userDefaults.objectForKey("dictFlag") as! NSMutableDictionary
        
        self.nameCountry.setText(dictFlag.objectForKey("nome") as? String)
        self.localizationCountry.setText("\(dictFlag.objectForKey("latitude") as! CLLocationDegrees), \(dictFlag.objectForKey("longitude") as! CLLocationDegrees)")
        self.imageFlag.setImage(UIImage(named: (dictFlag.objectForKey("nomeBandeira") as? String)!))
        
        let indexTable = dictFlag.objectForKey("index") as! Int
        
        updateUserActivity("mochileiro", userInfo: ["controller":indexTable], webpageURL: nil)
    }
    
//    func updateUserActivity(type: String, userInfo: [NSObject : AnyObject]?, webpageURL: NSURL?) {
//        
//    }

}

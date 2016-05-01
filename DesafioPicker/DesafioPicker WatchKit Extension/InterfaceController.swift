//
//  InterfaceController.swift
//  DesafioPicker WatchKit Extension
//
//  Created by Luís Resende on 10/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation

internal let NAME_IDENTIFIER_PICKER = "picker"
internal let CALORIES_FEM = 50 as Int
internal let CALORIES_MASC = 30 as Int

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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
    @IBAction func pushPickerViewFem(){
        self.pushControllerWithName(NAME_IDENTIFIER_PICKER, context: CALORIES_FEM)
    }

    @IBAction func pushPickerViewMasc() {
        self.pushControllerWithName(NAME_IDENTIFIER_PICKER, context: CALORIES_MASC)
    }
    
}

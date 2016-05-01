//
//  InterfaceController.swift
//  ComplicationTimeTravel WatchKit Extension
//
//  Created by Luís Resende on 08/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        print(ComplicationUtil.getArrayDictionary())
        print(ComplicationUtil.getStartDate())
        print(ComplicationUtil.getFinalDate())
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

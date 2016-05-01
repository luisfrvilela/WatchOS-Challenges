//
//  InterfaceControllerTwo.swift
//  Hello Watch
//
//  Created by Luís Resende on 11/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerTwo: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        print(context);
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

//
//  InterfaceController.swift
//  DeserializacaoJSON WatchKit Extension
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation

internal let jsonFile  = "https://api.myjson.com/bins/2jo7n"

class InterfaceController: WKInterfaceController {
   
    @IBOutlet var tableInformation: WKInterfaceTable!
    
    var arrayModels:NSMutableArray!

    override func awakeWithContext(context: AnyObject?) {
        
        arrayModels = iOSRequest.getAllModels(jsonFile)
        
        self.tableInformation.setNumberOfRows(arrayModels.count, withRowType: "row")
        
        for (index, item) in arrayModels.enumerate(){
            
            let row = self.tableInformation.rowControllerAtIndex(index) as! RowController
            
            row.labelPlaceName.setText((item as! ModelJSON).placeName)
            row.labelCountryCode.setText((item as! ModelJSON).countryCode)
            
        }
        
        super.awakeWithContext(context)
        
        
        
        // Configure interface objects here.
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "callDetail"{
            
            return arrayModels.objectAtIndex(rowIndex)
        }
        
        return nil
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

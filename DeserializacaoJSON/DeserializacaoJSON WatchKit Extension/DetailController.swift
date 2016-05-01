//
//  DetailController.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 17/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class DetailController: WKInterfaceController {
    
    @IBOutlet var labelPostalCode: WKInterfaceLabel!
    @IBOutlet var labelPlaceName: WKInterfaceLabel!
    @IBOutlet var labelCountryCode: WKInterfaceLabel!
    @IBOutlet var labelLongitude: WKInterfaceLabel!
    @IBOutlet var labelLatitude: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let modelDetail:ModelJSON = context as! ModelJSON
        
        self.labelPostalCode.setText(modelDetail.postalcode)
        self.labelPlaceName.setText(modelDetail.placeName)
        self.labelCountryCode.setText(modelDetail.countryCode)
        self.labelLongitude.setText("\(modelDetail.lng)")
        self.labelLatitude.setText("\(modelDetail.lat)")
        
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

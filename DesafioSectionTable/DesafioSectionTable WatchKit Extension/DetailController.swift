//
//  DetailController.swift
//  DesafioSectionTable
//
//  Created by Luís Resende on 18/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class DetailController: WKInterfaceController {
    
    @IBOutlet var imageProduct: WKInterfaceImage!
    @IBOutlet var imageCategory: WKInterfaceImage!
    @IBOutlet var labelCategory: WKInterfaceLabel!
    @IBOutlet var labelProduct: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let rowForDetail = context as! ModelJSON
        
        self.labelCategory.setText(rowForDetail.category)
        self.labelProduct.setText(rowForDetail.product)
        self.imageProduct.setImage(UIImage(named: rowForDetail.category))
        self.imageCategory.setImage(UIImage(named: rowForDetail.category))
        
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

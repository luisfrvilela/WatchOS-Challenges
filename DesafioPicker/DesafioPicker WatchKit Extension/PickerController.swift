//
//  PickerController.swift
//  DesafioPicker
//
//  Created by Luís Resende on 10/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class PickerController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    
    var items: [String]! = nil
    var maxCalories:Int = 0
    var indexAnimation:Int = 0
    
    override func awakeWithContext(context: AnyObject?) {
        self.configurePicker()
        self.maxCalories = context as! Int
        self.animatePicker()
        super.awakeWithContext(context)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func configurePicker(){
        items = (0...100).map{"image\($0).png"}
        
        let pickerItems: [WKPickerItem] = items.map{
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: $0)
            return pickerItem
        }
        
        self.picker.setItems(pickerItems)
        self.picker.setEnabled(false)
    }
    
    func animatePicker(){
        self.picker.setSelectedItemIndex(self.indexAnimation)
        self.indexAnimation = (self.indexAnimation + 1)
        if self.indexAnimation <= self.maxCalories {
            self.performSelector(Selector("animatePicker"), withObject: nil, afterDelay: 0.03)
        }
    }
}

//
//  InterfaceController.swift
//  pickerExemplo WatchKit Extension
//
//  Created by Luís Resende on 10/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myPicker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
//        let fruits: [(String,String,String)] = [("Apple","I love Cupertino","Apple-icon-128"), ("Banana","Yes we have","Banana-icon-128"), ("Cherry","Essa é a cereja do bolo","Cherry-icon-128"), ("Kiwi","Precisa de um barbeador","Kiwi-icon-128"), ("Lemon","Caipirinha","Lemon-icon-128"), ("Strawberry","Strawberry feels free","Strawberry-icon-128")]
//        
//        let pickerItems: [WKPickerItem] = fruits.map {
//            let pickerItem = WKPickerItem()
//            pickerItem.title = $0.0
//            pickerItem.caption = $0.1
//            pickerItem.contentImage = WKImage(imageName: $0.2)
//            
//            return pickerItem
//        }
//        
//        self.myPicker.setItems(pickerItems)
        
        var items: [String]! = nil

        items = (0...100).map{"image\($0).png"}
        
        let pickerItems: [WKPickerItem] = items.map{
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: $0)
            return pickerItem
        }
        
        self.myPicker.setItems(pickerItems)
        
        // Configure interface objects here.
    }

    @IBAction func getPickerValue(value: Int) {
        print("Item selecionado:\(value)")
        
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

//
//  InterfaceController.swift
//  GeradorCitacoes WatchKit Extension
//
//  Created by Luís Resende on 12/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var listStaff = Catchphrases.listOfPhrases.filter(){
        return !Staff.showAllObjects()!.contains($0)
    }
    
    var staffgenerate: String = ""
    var boolShowAllStaff = false
    
    @IBOutlet var labelStaff: WKInterfaceLabel!
    @IBOutlet var labelSave: WKInterfaceLabel!
    @IBOutlet var buttonPass: WKInterfaceButton!
    @IBOutlet var buttonSave: WKInterfaceButton!
    @IBOutlet var buttonShowStaff: WKInterfaceButton!
    
    @IBOutlet var staffTable: WKInterfaceTable!
    
    var managedContext: AnyObject?
    
    @IBAction func generateStaff() {
        
        self.labelSave.setHidden(true)
        self.labelSave.setAlpha(1)
        
        staffgenerate = listStaff[Int.random(listStaff.count-1)()]
        
        labelStaff.setText(staffgenerate)
        
    }
    
    @IBAction func saveStaff() {
        self.labelSave.setHidden(false)
        Staff.saveObjectData(staffgenerate)
        animateWithDuration(1) { () -> Void in
            self.labelSave.setAlpha(0)
        }
        
        self.performSelector("generateStaff", withObject: nil, afterDelay: 1)
    }
    
    @IBAction func showAllStaff() {

        if self.boolShowAllStaff==false {
            
            self.staffTable.setHidden(false)
            self.boolShowAllStaff = true
            self.buttonShowStaff.setTitle("Esconder Bordões")
            self.staffTable.setNumberOfRows((Staff.showAllObjects()?.count)!, withRowType: "tableStaff")
            
            for (index,staffString) in Staff.showAllObjects()!.enumerate(){
                
                let row = self.staffTable.rowControllerAtIndex(index) as! CellRowController
                
                row.label.setText(staffString)
            }
            
        }else{
            self.buttonShowStaff.setTitle("Mostrar Bordões")
            self.boolShowAllStaff = false
            self.staffTable.setHidden(true)
            
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        self.generateStaff()
        self.labelSave.setHidden(true)
        self.buttonShowStaff.setTitle("Mostrar Bordões")
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

}

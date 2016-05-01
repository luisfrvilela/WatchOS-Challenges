//
//  InterfaceController.swift
//  IntroducaoAnimation WatchKit Extension
//
//  Created by Luís Resende on 18/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var labelNome: WKInterfaceLabel!
    @IBOutlet var grupo: WKInterfaceGroup!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.labelNome.setAlpha(0)
        
        animateWithDuration(2) { () -> Void in
            
            self.grupo.setHeight(0)
            self.labelNome.setAlpha(1)
            self.labelNome.setText("Ola Luis Filipe")
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func mudarTexto() {
        
        animateWithDuration(2) { () -> Void in
            self.grupo.setHeight(100)
            self.labelNome.setText("novo texto")
        }
        
    }

}

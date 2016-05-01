//
//  InterfaceController.swift
//  DictationExample WatchKit Extension
//
//  Created by Luís Resende on 23/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var labelResult: WKInterfaceLabel!
    @IBOutlet var imageGIF: WKInterfaceImage!
    
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
    
    @IBAction func actionSpeak() {
        
        let options = ["Sim", "Não", "Manda a Lud", "Talvez", "Se liga", "Agora"]
        
        presentTextInputControllerWithSuggestions(options, allowedInputMode: .AllowAnimatedEmoji) { (result) -> Void in
            
            if result != nil && result?.count > 0{
                
                //Works to emoji and Plain
                if let myResult = result!.first as? String {
                    self.labelResult.setHidden(false)
                    self.labelResult.setText(myResult)
                    self.imageGIF.setHidden(true)
                }else{
                    self.labelResult.setHidden(true)
                    self.imageGIF.setHidden(false)
                    self.imageGIF.setImageData(result!.first as? NSData)
                }
            }
            
        }
        
    }

}

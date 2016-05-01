//
//  InterfaceController.swift
//  IntroductionAnimation2 WatchKit Extension
//
//  Created by Luís Resende on 19/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var group: WKInterfaceGroup!
    @IBOutlet var image: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.image.setImageNamed("roda-")
        self.image.startAnimatingWithImagesInRange(NSMakeRange(0, 5), duration: 0.3, repeatCount: 2)
        
        animateWithDuration(2) { () -> Void in
            self.group.setHeight(0)
            self.image.startAnimating()
        }
        
        
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(2*Double(NSEC_PER_SEC)))
        
        dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.8, animations: { () -> Void in
                self.image.setHeight(0)
                self.image.stopAnimating()
            })
            
        }
        
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

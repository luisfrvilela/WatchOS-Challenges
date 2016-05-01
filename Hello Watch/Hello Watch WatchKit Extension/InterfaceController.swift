//
//  InterfaceController.swift
//  Hello Watch WatchKit Extension
//
//  Created by Luís Resende on 11/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var timer: WKInterfaceTimer!
    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var labelVoltas: WKInterfaceLabel!
    
    var numeroVoltas = 0;
    var comecouTimer = false;

    @IBAction func startTimerAction() {
        
        if (!self.comecouTimer){
            self.button.setTitle("Volta!")
            
            let countDownInSeconds: NSTimeInterval = 10
            let timerCountDownDate = NSDate(timeIntervalSinceNow: countDownInSeconds)
            
            
            self.timer.setDate(timerCountDownDate)
            self.timer.start();
            self.labelVoltas.setHidden(false)
            self.comecouTimer = true
            
            self.performSelector("resetTimer", withObject: nil, afterDelay: countDownInSeconds)
            
        }else{
            self.adicionarVolta()
        }
    }
    
    func adicionarVolta(){
        self.numeroVoltas++
        self.labelVoltas.setText("Volta: \(self.numeroVoltas)")
    }
    
    func resetTimer(){
        self.labelVoltas.setHidden(true)
        self.button.setTitle("Começar!")
//        animateWithDuration(1) { () -> Void in
//            
//        }
        
        self.comecouTimer = false
        self.numeroVoltas = 0
        self.labelVoltas.setText("Volta: \(self.numeroVoltas)")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        self.labelVoltas.setHidden(true)
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

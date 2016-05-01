//
//  InterfaceController.swift
//  DesafioHealthKit WatchKit Extension
//
//  Created by Luís Resende on 19/04/16.
//  Copyright © 2016 luisbepid. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    let healthService: ServiceUtil = ServiceUtil()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
       
        self.setupTable()
    }
    
    override func willActivate() {
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.askForAuthorization()
    }

    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let row = table.rowControllerAtIndex(rowIndex) as! TypeExerciseRowController
        guard let exercise = row.exerciseType else {return nil}

        return WorkoutExerciseType(exerciseType:exercise)

    }
    
    func setupTable() {
        let allExercises = ExerciseType.allValues
        table.setNumberOfRows(allExercises.count, withRowType: "TypeExerciseRowController")
        
        var i = 0
        for exercise in allExercises {
            let row = table.rowControllerAtIndex(i) as! TypeExerciseRowController
            row.exerciseType = exercise
            i += 1
        }
    }
    
    func askForAuthorization () {
        
        healthService.authorizeHealthKitAcess { (success, error) in
            
            if success {
                print ("Autorizou")
            } else {
                print ("Não autorizou")
                
                if error != nil {
                    
                    print ("\(error)")
                }
            }
            
            return nil
        }
    }


}

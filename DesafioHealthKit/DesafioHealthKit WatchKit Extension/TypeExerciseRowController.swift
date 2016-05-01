//
//  TypeExerciseRowController.swift
//  DesafioHealthKit
//
//  Created by Luís Resende on 19/04/16.
//  Copyright © 2016 luisbepid. All rights reserved.
//

import WatchKit

class TypeExerciseRowController: NSObject {

@IBOutlet var lblTypeExercise: WKInterfaceLabel!

var exerciseType: ExerciseType? {
        willSet(type) {
            lblTypeExercise.setText(type!.title)
           
        }

    }

}

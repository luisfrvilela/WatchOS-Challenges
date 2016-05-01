//
//  WorkoutExerciseType.swift
//  DesafioHealthKit
//
//  Created by Luís Resende on 20/04/16.
//  Copyright © 2016 luisbepid. All rights reserved.
//

import Foundation

class  WorkoutExerciseType{
    
    let exerciseType: ExerciseType
 
    init(exerciseType: ExerciseType = .Other, activeTime: NSTimeInterval = 120, restTime: NSTimeInterval = 30) {
        self.exerciseType = exerciseType
    }    
    
}
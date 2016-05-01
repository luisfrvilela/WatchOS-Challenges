//
//  Service.swift
//  ExemploWorkout
//
//  Created by Luís Resende on 18/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation
import HealthKit

public class Service {
    
    internal let healthKitStore:HKHealthStore = HKHealthStore()
    
    let energyType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
    
    let cyclingDistanceType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling)!
    
    func authorizeHealthKitAccess(completion: ((success:Bool, error:NSError!) -> Void)!) {
        
        let typesToShare = Set([
            HKObjectType.workoutType(),
            energyType,
            cyclingDistanceType,
        ])
        
        let typesToRead = Set([
            energyType,
            cyclingDistanceType,
        ])
        
        healthKitStore.requestAuthorizationToShareTypes(typesToShare, readTypes: typesToRead) { (success, error) in completion(success: success, error: error)
        }
    }
    
}
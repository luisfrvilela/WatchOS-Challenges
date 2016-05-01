//
//  ServiceUtil.swift
//  exWorkout
//
//  Created by Luís Resende on 18/04/16.
//  Copyright © 2016 luisbepid. All rights reserved.
//

import Foundation
import HealthKit



public class ServiceUtil {
    internal let healthKitStore:HKHealthStore = HKHealthStore()

    let energyType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!
    
    
    // Propriedade para liberar acesso a distância
    let ciclingDistanceType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling)!
    
    
     let energyBurned = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!

    
    func authorizeHealthKitAcess(completion:((sucess:Bool,error:NSError!)->Void!)){
        
        let typeToShare = Set([
                HKObjectType.workoutType(),
                energyType,
                energyBurned,
                ciclingDistanceType,
        ])
    
        
        let typesToRead = Set([
            energyType,
            energyBurned,
            ciclingDistanceType,
        ])
        
        healthKitStore.requestAuthorizationToShareTypes(typeToShare,readTypes:typesToRead){ success,error in
            
            completion (sucess:success, error:error)
        
        
        }
    
    
    }

    
}
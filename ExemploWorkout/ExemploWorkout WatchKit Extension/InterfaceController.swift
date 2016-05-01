//
//  InterfaceController.swift
//  ExemploWorkout WatchKit Extension
//
//  Created by Luís Resende on 18/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController, HKWorkoutSessionDelegate {
    
    var session:HKWorkoutSession? = nil
    let healthService = Service()
    var startDate:NSDate!
    var endDate:NSDate!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        requestAuthorization()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func requestAuthorization() {
        healthService.authorizeHealthKitAccess { (success, error) in
            if success {
                print("autorizou")
            }else{
                print("nao autorizou")
                if error != nil {
                    print(error)
                }
            }
        }
    }
    
    func buildSession (){
        session = HKWorkoutSession(activityType: .Cycling, locationType: .Indoor)
        session?.delegate = self
        print("Montou sessao")
    }
    
    func workoutSession(workoutSession: HKWorkoutSession, didFailWithError error: NSError) {
        
    }
    
    func workoutSession(workoutSession: HKWorkoutSession, didChangeToState toState: HKWorkoutSessionState, fromState: HKWorkoutSessionState, date: NSDate) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            switch toState {
            case .Running:
                print("Sessao startou pravaler")
                break
            case .Ended:
                print("Sessao terminou pravaler")
                break
            default:
                print("Sessao mudou para um estado desconhecido")
                break
            }
            
        }
        
    }
    
    private func sessionStarted(date: NSDate){
        startDate = date
        healthService.healthKitStore.startWorkoutSession(session!)
        print("session started")
    }
    
    private func sessionEnded(date: NSDate){
        endDate = date
        healthService.healthKitStore.endWorkoutSession(session!)
        print("session ended")
    }
    
    func saveWorkout(){
        
        let workout = HKWorkout(
            activityType: .Cycling,
            startDate: startDate,
            endDate: endDate,
            duration: endDate.timeIntervalSinceDate(startDate),
            totalEnergyBurned: HKQuantity(unit: HKUnit.meterUnit(), doubleValue: 10.0),
            totalDistance: HKQuantity(unit: HKUnit.meterUnit(), doubleValue: 10.0),
            device: HKDevice.localDevice(),
            metadata: nil)
        
        healthService.healthKitStore.saveObject(workout) { (success, error) in
            
            if success {
                print("Salvou ihuuul")
            }else{
                print("Deu ruim")
                print(error?.description)
            }
            
        }
        
    }

}

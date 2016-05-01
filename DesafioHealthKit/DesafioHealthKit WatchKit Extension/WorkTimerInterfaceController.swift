//
//  WorkTimerInterfaceController.swift
//  DesafioHealthKit
//
//  Created by Luís Resende on 19/04/16.
//  Copyright © 2016 luisbepid. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit


class WorkTimerInterfaceController: WKInterfaceController, HKWorkoutSessionDelegate {

    @IBOutlet var countDownGroup: WKInterfaceGroup!
    @IBOutlet var timeActive: WKInterfaceGroup!
    @IBOutlet var timerActivity: WKInterfaceTimer!
    @IBOutlet var countDownTimer: WKInterfaceTimer!
    @IBOutlet var labelActive: WKInterfaceLabel!
    @IBOutlet var groupSaveWorkout: WKInterfaceGroup!
    
    var session: HKWorkoutSession? = nil
    let healthService: ServiceUtil = ServiceUtil()
    var startDate: NSDate?
    var endDate: NSDate?
    var dateStartTime:NSDate!
    var dateStopTime:NSDate!
    var indexActive:NSInteger = 0
    var workoutConfiguration: WorkoutExerciseType?
    var exerciseType: ExerciseType? {
        willSet(type) {
            self.labelActive.setText(type!.title)
        }
        
    }

    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
      
        
        workoutConfiguration = context as? WorkoutExerciseType
        
        self.exerciseType = workoutConfiguration?.exerciseType
        
        let coundownDuration: NSTimeInterval = 5
        countDownGroup.setHidden(false)
        countDownGroup.setBackgroundImageNamed("progress_ring")
        countDownGroup.startAnimatingWithImagesInRange(NSRange(location: 0, length: 91), duration: -coundownDuration, repeatCount: 1)
        self.countDownTimer.setDate(NSDate(timeIntervalSinceNow: coundownDuration+1))
        self.countDownTimer.start()
        NSTimer.scheduledTimerWithTimeInterval(coundownDuration+0.2, target: self, selector: #selector(WorkTimerInterfaceController.start(_:)), userInfo: nil, repeats: false)
        
        self.setupSession()

        
    }
    
   
    // Start the timer and the workout session after a short countdown
    @IBAction func start(sender: AnyObject?) {
        self.countDownGroup.setHidden(true)
        self.timeActive.setHidden(false)
        dateStartTime = NSDate()
        self.timerActivity.setDate(dateStartTime)
        self.sessionStarted(dateStartTime)
        self.timerActivity.start()
    }
    
    @IBAction func endWorkout() {
        self.countDownGroup.setHidden(true)
        self.timeActive.setHidden(true)
        self.groupSaveWorkout.setHidden(false)
        self.timerActivity.stop()
        self.sessionEnded(NSDate())
    }
    
    @IBAction func cancelWorkout() {
        
    
    }
    
    @IBAction func saveWorkout() {
        self.saveWorkoutHealthKit()
        self.popController()
    
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        }

    
    
    // MARK: HealthKit
    func setupSession () {
        
        session = HKWorkoutSession(activityType: HKWorkoutActivityType.Other, locationType: HKWorkoutSessionLocationType.Indoor)
        
        session?.delegate = self
        
        print ("Criou sessão")
    }
    
    func workoutSession(workoutSession: HKWorkoutSession, didFailWithError error: NSError) {
        
    }
    
    func workoutSession(workoutSession: HKWorkoutSession, didChangeToState toState: HKWorkoutSessionState, fromState: HKWorkoutSessionState, date: NSDate) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            switch toState {
                
            case .Running:
                
                print ("Sessão começou legal")
                
            case .Ended:
                
                print ("Sessão terminou legal")
                
            default:
                
                print ("Sessão mudou para um estado desconhecido")
            }
        }
    }
    
    private func sessionStarted(date:NSDate) {
        
        startDate = date
        healthService.healthKitStore.startWorkoutSession(session!)
        print ("Sessao começou")
        
    }
    
    private func sessionEnded (date: NSDate) {
        
        endDate = date
        
        healthService.healthKitStore.endWorkoutSession(session!)
        print ("Sessão parou")
    }

    func saveWorkoutHealthKit () {
        
        let workout = HKWorkout(activityType: HKWorkoutActivityType.Other
            , startDate: startDate!
            , endDate: endDate!
            , duration: endDate!.timeIntervalSinceDate(startDate!)
            , totalEnergyBurned: HKQuantity(unit: HKUnit.kilocalorieUnit(), doubleValue: 200.0)
            , totalDistance: HKQuantity(unit: HKUnit.meterUnit()
                , doubleValue: 20.0)
            , device: HKDevice.localDevice()
            , metadata: nil)
       
        
        healthService.healthKitStore.saveObject(workout, withCompletion: { (success, error) in
            
            if success {
                print ("Salvou")
            } else {
                print ("Deu ruim")
                print (error?.description)
            }
        })
        
    }

}

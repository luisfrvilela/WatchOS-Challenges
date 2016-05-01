//
//  ComplicationController.swift
//  Complication1 WatchKit Extension
//
//  Created by Luís Resende on 07/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        handler(ComplicationUtil.generatePlaceHolder(complication))
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        handler(ComplicationUtil.generatePopulation(complication))
    }
    
//    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
//        // Call the handler with the timeline entries prior to the given date
//        handler(nil)
//    }
//    
//    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
//        // Call the handler with the timeline entries after to the given date
//        handler(nil)
//    }
//    
//    // MARK: - Update Scheduling
//    
//    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
//        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
//        handler(nil);
//    }
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler(.None)
    }
    
//    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
//        handler(nil)
//    }
//    
//    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
//        handler(nil)
//    }
//    
//    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
//        handler(.ShowOnLockScreen)
//    }
    
    
    
}

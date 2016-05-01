//
//  ComplicationUtil.swift
//  Complication1
//
//  Created by Luís Resende on 07/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import ClockKit

internal let placeholderText = "Wind Speed: 50"
internal let KEY_DATE_OPEN = "dateOpen"
internal let KEY_DICT_CHICAGO = "speedWindChicago"

class ComplicationUtil: NSObject {
    
    static func isFirstTimeOfDay()->Bool{
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let calendarToday = calendar!.components([.Day, .Month, .Year], fromDate: NSDate())
        
        if let stringDate = userDefaults.objectForKey(KEY_DATE_OPEN) {
            
            if (stringDate as! String) == "\(calendarToday.day),\(calendarToday.month),\(calendarToday.year)" {
                return false
            }else{
                //Primeira vez do dia
                userDefaults.setObject("\(calendarToday.day),\(calendarToday.month),\(calendarToday.year)", forKey: KEY_DATE_OPEN)
                userDefaults.synchronize()
                return true
            }
        }else{
            //Primeira vex que instala o app
            userDefaults.setObject("\(calendarToday.day),\(calendarToday.month),\(calendarToday.year)", forKey: KEY_DATE_OPEN)
            userDefaults.synchronize()
            return true
        }
    }

    static func getArrayDictionary()->NSMutableArray {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if isFirstTimeOfDay() == true {
            let arrayDict = iOSRequest.getArrayDictionary()
            userDefaults.setObject(arrayDict, forKey: KEY_DICT_CHICAGO)
            userDefaults.synchronize()
            reloadDataComplications()
            return arrayDict
        }else{
            let arrayDict = userDefaults.objectForKey(KEY_DICT_CHICAGO) as! NSMutableArray
            return arrayDict
        }
    }
    
    static func reloadDataComplications(){
        
        let server = CLKComplicationServer.sharedInstance()
        guard let complications = server.activeComplications
            where complications.count > 0 else { return }
        
        for complication in complications {
            server.reloadTimelineForComplication(complication)
        }
    }
    
    static func getStartDate()->NSDate{
        return getDateByCompare(.OrderedDescending)
    }
    static func getFinalDate()->NSDate{
        return getDateByCompare(.OrderedAscending)
    }
    
    static func getDateByCompare(resultComparasion:NSComparisonResult)->NSDate{
        
        let arrayDictAllWind = getArrayDictionary()
        var startDate = NSDate()
        
        for item in arrayDictAllWind{
            let dictWind = item as! NSMutableDictionary
            let dateWind = dictWind.valueForKey("dateWind") as! NSDate
            
            if startDate.compare(dateWind) == resultComparasion{
                startDate = dateWind
            }
        }
        
        return startDate
    }
    
    static func getWindSpeedOf(date:NSDate)->String {
        
        let arrayDictAllWind = getArrayDictionary()
        print(arrayDictAllWind)
        let newArray = arrayDictAllWind.sort { (dict1:AnyObject, dict2:AnyObject) -> Bool in
            
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let dateWind2 = dict2.objectForKey("dateWind") as! NSDate
            
            let isBigger = fabs(dateWind1.timeIntervalSinceDate(date)) >=  fabs(dateWind2.timeIntervalSinceDate(date))
            
            return !isBigger
        }
        
        let windSpeed = newArray.first?.objectForKey("velocity") as! String
        
        return windSpeed
    }
    
    static func getWindSpeedBefore(date:NSDate)->NSArray {
        
        let arrayDictAllWind = getArrayDictionary()
        
        let newArray = arrayDictAllWind.filter { (dict1:AnyObject) -> Bool in
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let isBigger = dateWind1.timeIntervalSinceDate(date) < 0
            
            return isBigger
        }
        
        return newArray
    }
    
    static func getWindSpeedAfter(date:NSDate)->NSArray {
        
        let arrayDictAllWind = getArrayDictionary()
        
        let newArray = arrayDictAllWind.filter { (dict1:AnyObject) -> Bool in
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let isBigger = dateWind1.timeIntervalSinceDate(date) >= 0
            
            return isBigger
        }
        
        return newArray
    }
    
    static func generatePlaceHolder(complication:CLKComplication) -> CLKComplicationTemplate?{
        return populate(complication, textComplication: placeholderText)
    }
    
    static func generatePopulation(complication:CLKComplication, date:NSDate) -> CLKComplicationTimelineEntry?{
        
        let textComplication:String = "Wind Speed: " + getWindSpeedOf(date)
        
        let complicationTemplate = populate(complication, textComplication: textComplication)
        
        if complicationTemplate != nil {
            let complicationTimelineEntry = CLKComplicationTimelineEntry(
                date: date, complicationTemplate: complicationTemplate!)
            return complicationTimelineEntry
        }else{
            return nil
        }
    }
    
    static func generatePopulationBeforeDate(complication:CLKComplication, date:NSDate) -> ([CLKComplicationTimelineEntry]?){
        let arrayWinds = getWindSpeedBefore(date)
        return generatePopulationWithDifferentDate(arrayWinds, complication: complication, date: date)
    }
    
    static func generatePopulationAfterDate(complication:CLKComplication, date:NSDate) -> ([CLKComplicationTimelineEntry]?){
        let arrayWinds = getWindSpeedAfter(date)
        return generatePopulationWithDifferentDate(arrayWinds, complication: complication, date: date)
    }
    
    static func generatePopulationWithDifferentDate(arrayWinds:NSArray,complication:CLKComplication, date:NSDate) -> ([CLKComplicationTimelineEntry]?){
        
        var arrayComplications:([CLKComplicationTimelineEntry]?) = []
        
        for dict in arrayWinds {
            let date = dict.objectForKey("dateWind") as! NSDate
            let complication = generatePopulation(complication, date: date)
            arrayComplications?.append(complication!)
        }
        
        return arrayComplications
    }
    
    static func populate(complication:CLKComplication, textComplication:String) -> CLKComplicationTemplate?{
        
        if complication.family == .ModularLarge {
            let modularLarge = CLKComplicationTemplateModularLargeStandardBody()
            modularLarge.headerTextProvider = CLKSimpleTextProvider (text: "Chicago")
            modularLarge.body1TextProvider = CLKSimpleTextProvider(text: textComplication)
            return modularLarge
            
        }else if complication.family == .UtilitarianSmall {
            let templateComplication = CLKComplicationTemplateUtilitarianSmallFlat()
            templateComplication.textProvider = CLKSimpleTextProvider(text: textComplication)
            return templateComplication
        }else if complication.family == .UtilitarianLarge {
            let templateComplication = CLKComplicationTemplateUtilitarianLargeFlat()
            templateComplication.textProvider = CLKSimpleTextProvider(text: textComplication)
            return templateComplication
        }else if complication.family == .CircularSmall {
            let templateComplication = CLKComplicationTemplateCircularSmallSimpleText()
            templateComplication.textProvider = CLKSimpleTextProvider(text: textComplication)
            return templateComplication
        }else{
            return nil
        }
    }
    
}

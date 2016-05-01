//
//  ComplicationUtil.swift
//  Complication1
//
//  Created by Luís Resende on 07/04/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import WatchKit
import ClockKit

internal let placeholderText = "😎 6:40 pm"


class ComplicationUtil: NSObject {

    
    static func generatePlaceHolder(complication:CLKComplication) -> CLKComplicationTemplate?{
        return populate(complication, textComplication: placeholderText)
    }
    
    static func generatePopulation(complication:CLKComplication) -> CLKComplicationTimelineEntry?{
        
        let textComplication:String = getEmoji() + iOSRequest.getHour()
        
        let complicationTemplate = populate(complication, textComplication: textComplication)
        
        if complicationTemplate != nil {
            let complicationTimelineEntry = CLKComplicationTimelineEntry(
                date: NSDate(), complicationTemplate: complicationTemplate!)
            return complicationTimelineEntry
        }else{
            return nil
        }
    }
    
    static func populate(complication:CLKComplication, textComplication:String) -> CLKComplicationTemplate?{
        
        if complication.family == .ModularLarge {
            let modularLarge = CLKComplicationTemplateModularLargeStandardBody()
            modularLarge.headerTextProvider = CLKSimpleTextProvider (text: "Pôr do sol no Havaí")
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
    
    static func isActivityDone(index:Int)->Bool{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let activityDone = userDefaults.objectForKey("activity\(index)") as! Bool
        return activityDone
    }
    
    static func getEmoji()->String{
        
        var numberActivitiesDone = 0
        var emoji = ""
        
        for i in 0...activities.count{
            let isDone = isActivityDone(i)
            if isDone == true{
                numberActivitiesDone = numberActivitiesDone + 1
            }
        }
        
        if numberActivitiesDone == 0{
         emoji = "😡 "
        }else{
            let percentageDone = Int(((Double(numberActivitiesDone)/Double(activities.count)) * 100))
            
            if percentageDone < 50 {
                emoji = "😢 "
            }else if percentageDone >= 50 && percentageDone <= 75 {
                emoji = "😐 "
            }else {
                emoji = "😎 "
            }
        }
        
        return emoji
    }
}

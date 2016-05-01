//
//  iOSRequest.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation


class iOSRequest: NSObject{
    
    class func parseJSON(data: NSData) -> NSDictionary{
        var jsonResult: NSDictionary = NSDictionary()
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSDictionary)!
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    class func getJSON(urlToRequest: String) -> NSDictionary{
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        return parseJSON(jsonData)
    }
    
    class func getAllModels(urlToRequest: String)->NSMutableArray{
        
        let dictionaryJSON = getJSON(urlToRequest)
        
        let arrayValues:Array<NSDictionary> = dictionaryJSON.valueForKey("postalcodes") as! Array<NSDictionary>
        
        let arrayJSON: NSMutableArray = NSMutableArray()
        
        for itemDictionary in arrayValues.enumerate(){
            
            let modelItem: ModelJSON = ModelJSON(_adminCode1: itemDictionary.element.objectForKey("adminCode1") as? String, _adminCode2: itemDictionary.element.objectForKey("adminCode2") as? String, _adminCode3: itemDictionary.element.objectForKey("adminCode3") as? String, _adminName1: itemDictionary.element.objectForKey("adminName1") as? String, _adminName2: itemDictionary.element.objectForKey("adminName2") as? String, _adminName3: itemDictionary.element.objectForKey("adminName3") as? String, _countryCode: itemDictionary.element.objectForKey("countryCode") as? String, _lat: itemDictionary.element.objectForKey("lat") as? Double, _lng: itemDictionary.element.objectForKey("lng") as? Double, _placeName: itemDictionary.element.objectForKey("placeName") as? String, _postalCode: itemDictionary.element.objectForKey("postalcode") as? String)
            
            arrayJSON.addObject(modelItem)
            
        }
        
        return arrayJSON
    }
}


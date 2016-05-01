//
//  iOSRequest.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation

internal let jsonURL  = "https://query.yahooapis.com/v1/public/yql?q=select%20astronomy.sunset%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22maui%2C%20hi%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"

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
    
    class func getHour()->String{
        
        let dictionaryJSON = getJSON(jsonURL)
        print(dictionaryJSON)
        let query = dictionaryJSON.valueForKey("query") as! NSDictionary
        let results = query.valueForKey("results") as! NSDictionary
        let channel = results.valueForKey("channel") as! NSDictionary
        let astronomy = channel.valueForKey("astronomy") as! NSDictionary
        let hourSunset = astronomy.valueForKey("sunset") as! String
        
        return hourSunset
    }
}


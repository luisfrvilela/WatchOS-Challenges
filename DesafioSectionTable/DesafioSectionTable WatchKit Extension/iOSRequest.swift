//
//  iOSRequest.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation


class iOSRequest: NSObject{
    
    class func parseJSON(data: NSData) -> NSMutableArray{
        var jsonResult: NSMutableArray = NSMutableArray()
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSMutableArray)!
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    class func getJSON(urlToRequest: String) -> NSMutableArray{
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        return parseJSON(jsonData)
    }
    
    class func getAllProductsAndSections(urlToRequest: String)->NSMutableDictionary{
        
        let arrayValues:NSMutableArray = getJSON(urlToRequest)
   
        let arrayJSON: NSMutableArray = NSMutableArray()
        
        let allKeysJSON = (arrayValues.firstObject as? NSDictionary)!.allKeys
        
        for product in arrayValues.enumerate(){
            
            for key in allKeysJSON{
                let stringKey = key as! String
                let product: ModelJSON = ModelJSON(_category:stringKey , _product: product.element.objectForKey(stringKey) as? String)
                arrayJSON.addObject(product)
            }
        }
        
        let allProductsAndSections: NSMutableDictionary = NSMutableDictionary()
        
        allProductsAndSections.setObject(arrayJSON, forKey: "products")
        allProductsAndSections.setObject(allKeysJSON, forKey: "sections")
        
        return allProductsAndSections
    }
}


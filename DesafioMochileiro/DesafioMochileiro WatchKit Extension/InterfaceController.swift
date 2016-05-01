//
//  InterfaceController.swift
//  DesafioMochileiro WatchKit Extension
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import WatchKit
import Foundation

internal let bandeiras = [("bandeiraBrasil","brasil",-15.831069 ,-48.510076),
                          ("bandeiraArgentina","argentina",-36.662061 ,-64.901651),
                          ("bandeiraPortugal","portugal",39.442356 ,-8.152346),
                          ("bandeiraCanada","canada",58.945756 ,-110.733034),
                          ("bandeiraIrlanda","irlanda",53.343320 ,-6.447420),
                          ("bandeiraEua","eua",38.301736 ,-102.256085)]


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var flags: NSMutableArray = NSMutableArray()
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.populateFlags()
        actualFlag.populateVideos()
        actualFlag.populateAudios()
        self.mountTableRow()
    }

    
    func populateFlags() {
        
        for information in bandeiras.enumerate() {
            let name = information.element.0
            let nameFlag = information.element.1
            let latitude = information.element.2
            let longitude = information.element.3
            self.flags.addObject(Flag(_bandeira: name, _nome: nameFlag, _lat: latitude, _long: longitude))
        }
    }
    
    func mountTableRow() {
        self.table.setNumberOfRows(flags.count, withRowType: "row")
        
        for (index,value) in flags.enumerate() {
            let row = table.rowControllerAtIndex(index) as? FlagRow
            let banAux:Flag = value as! Flag
            row?.bandeiraIMG.setImageNamed(banAux.flag)
            
        }
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let aux = flags[rowIndex] as! Flag
        actualFlag.flag = aux
        self.pushControllerWithName("bandeiraDetail", context: nil)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let dictionaryFlag = NSMutableDictionary()
        dictionaryFlag.setObject(aux.latitude, forKey: "latitude")
        dictionaryFlag.setObject(aux.longitude, forKey: "longitude")
        dictionaryFlag.setObject(aux.nameFlag, forKey: "nome")
        dictionaryFlag.setObject(aux.flag, forKey: "nomeBandeira")
        dictionaryFlag.setObject(rowIndex, forKey: "index")
        userDefaults.setObject(dictionaryFlag, forKey: "dictFlag")
        userDefaults.synchronize()
        
    }
    
    override func handleUserActivity(userInfo: [NSObject : AnyObject]?) {
        
        let controllerIndex = userInfo!["controller"] as! Int
        
        let rootController = WKExtension.sharedExtension().rootInterfaceController as! InterfaceController
        
        rootController.popToRootController()
        
        rootController.pushControllerWithName("bandeiraDetail", context: controllerIndex)
        
    }
}



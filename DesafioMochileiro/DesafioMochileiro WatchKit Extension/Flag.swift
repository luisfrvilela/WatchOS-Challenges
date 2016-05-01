//
//  Flag.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import UIKit
import WatchKit
class Flag: NSObject {
    
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var flag: String!
    var nameFlag: String!
    
    init(_bandeira: String, _nome: String, _lat:CLLocationDegrees, _long:CLLocationDegrees ) {
        self.flag = _bandeira
        self.nameFlag = _nome
        self.latitude = _lat
        self.longitude = _long
    }
}


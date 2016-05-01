//
//  ModelJSON.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation

class ModelJSON: NSObject {
    
    var adminCode1: String!
    var adminCode2: String!
    var adminCode3: String!
    var adminName1: String!
    var adminName2: String!
    var adminName3: String!
    var countryCode: String!
    var lat: Double!
    var lng: Double!
    var placeName: String!
    var postalcode: String!
    
    init(_adminCode1: String?, _adminCode2: String?, _adminCode3: String?, _adminName1: String?, _adminName2: String?, _adminName3: String?, _countryCode: String?, _lat:Double?, _lng:Double?, _placeName:String?, _postalCode:String?){
        super.init()
        self.adminCode1 = _adminCode1
        self.adminCode2 = _adminCode2
        self.adminCode3 = _adminCode3
        self.adminName1 = _adminName1
        self.adminName2 = _adminName2
        self.adminName3 = _adminName3
        self.countryCode = _countryCode
        self.lat = _lat
        self.lng = _lng
        self.placeName = _placeName
        self.postalcode = _postalCode
    }
}

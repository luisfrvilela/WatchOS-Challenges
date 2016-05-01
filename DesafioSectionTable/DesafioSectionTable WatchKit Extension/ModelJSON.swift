//
//  ModelJSON.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation

class ModelJSON: NSObject {
    
    var category: String!
    var product: String!
    
    init(_category: String?, _product: String?){
        super.init()
        self.category = _category
        self.product = _product
    }
}

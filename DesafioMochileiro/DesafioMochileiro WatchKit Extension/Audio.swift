//
//  Audio.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 18/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import UIKit

class Audio: NSObject {

    
    var audioName: String!
    var audioPais:String!
    
    init(_nome:String, _pais: String) {
        self.audioName = _nome
        self.audioPais = _pais
    }
}

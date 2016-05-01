//
//  Movie.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 18/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    
    var videoName: String!
    var videoExtension: String!
    var videoPais:String!

    init(_nome:String, _extension:String, _pais: String) {
        self.videoName = _nome
        self.videoExtension = _extension
        self.videoPais = _pais
    }
}

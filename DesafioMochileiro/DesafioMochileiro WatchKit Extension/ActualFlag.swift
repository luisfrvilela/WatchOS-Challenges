//
//  ActualFlag.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import UIKit

var actualFlag = ActualFlag()
class ActualFlag: NSObject {

    var audioList: NSMutableArray!
    var videoList: NSMutableArray!
    var flag: Flag!
    
    
    func populateVideos() {
        videoList = NSMutableArray()
        videoList.addObject(Movie(_nome: "geralmovie", _extension: "mov", _pais: "all"))
        videoList.addObject(Movie(_nome: "canadamovie", _extension: "mov", _pais: "canada"))
        videoList.addObject(Movie(_nome: "irlandamovie", _extension: "mov", _pais: "irlanda"))
        videoList.addObject(Movie(_nome: "euamovie", _extension: "mov", _pais: "eua"))
        videoList.addObject(Movie(_nome: "argentinamovie", _extension: "mov", _pais: "argentina"))
        videoList.addObject(Movie(_nome: "portugalmovie", _extension: "mov", _pais: "portugal"))
        videoList.addObject(Movie(_nome: "brasilmovie", _extension: "mov", _pais: "brasil"))
    }
    
    func populateAudios() {
        audioList = NSMutableArray()
        audioList.addObject(Audio(_nome: "teste", _pais: "teste"))
        
    }
}

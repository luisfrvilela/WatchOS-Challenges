//
//  Events.swift
//  Aula02
//
//  Created by Pedro Neiva Alves on 2/15/16.
//  Copyright © 2016 Pedro Neiva Alves. All rights reserved.
//

import UIKit

class Events: NSObject {
    
    //Eventos de teste
    
    static let listOfEvents = [("Revisar matéria da última aula", "17:04"),("Estudar WatchKit", "18:00")]
    
    
}
extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

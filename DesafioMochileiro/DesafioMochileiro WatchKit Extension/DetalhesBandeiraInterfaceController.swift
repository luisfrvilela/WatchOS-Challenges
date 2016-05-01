//
//  DetalhesBandeiraInterfaceController.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import WatchKit
import Foundation


class DetalhesBandeiraInterfaceController: WKInterfaceController, CLLocationManagerDelegate {

    @IBOutlet var mapa: WKInterfaceMap!
    var localizacaoPrincipal: CLLocationManager = CLLocationManager()
    var localizacaoDoMapa: CLLocationCoordinate2D?
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if context != nil {
            let index = context as! Int
            let name = bandeiras[index].0
            let nameFlag = bandeiras[index].1
            let latitude = bandeiras[index].2
            let longitude = bandeiras[index].3
            print(index)
            let flag = Flag(_bandeira: name, _nome: nameFlag, _lat: latitude, _long: longitude)
            actualFlag.flag = flag
        }
         
        localizacaoPrincipal.requestWhenInUseAuthorization()
        localizacaoPrincipal.desiredAccuracy = kCLLocationAccuracyBest
        localizacaoPrincipal.delegate = self
        localizacaoPrincipal.requestLocation()
        // Configure interface objects here.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.localizacaoDoMapa = CLLocationCoordinate2DMake(actualFlag.flag.latitude, actualFlag.flag.longitude)
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(self.localizacaoDoMapa!, span)
        
        self.mapa.setRegion(region)
        self.mapa.addAnnotation(self.localizacaoDoMapa!, withPinColor: .Red)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.description)
    }

    @IBAction func gravarVideo() {
    }
    @IBAction func gravarAudio() {
    }
}

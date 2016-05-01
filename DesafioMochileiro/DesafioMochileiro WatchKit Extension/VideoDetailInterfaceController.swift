//
//  VideoDetailInterfaceController.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 18/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import WatchKit
import Foundation


class VideoDetailInterfaceController: WKInterfaceController {

    @IBOutlet var videoPlay: WKInterfaceMovie!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let videoAux = context as! Movie
        
        
        let url = NSBundle.mainBundle().URLForResource(videoAux.videoName, withExtension: videoAux.videoExtension)
        
        videoPlay.setMovieURL(url!)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

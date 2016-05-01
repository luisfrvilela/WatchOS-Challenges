//
//  VideoTableInterfaceController.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import WatchKit
import Foundation


class VideoTableInterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var videos: NSMutableArray = NSMutableArray()
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.popularVideos()
        self.mountTableRow()
    }
    
    func popularVideos() {
        for video in actualFlag.videoList {
            let aux = video as! Movie
            if (aux.videoPais == actualFlag.flag.nameFlag) {
                videos.addObject(aux)
            }
            if (aux.videoPais == "all") {
                videos.addObject(aux)
            }
        }
    }
    

    func mountTableRow() {
        self.table.setNumberOfRows(videos.count, withRowType: "row")
        
        for (index,value) in videos.enumerate() {
            let row = table.rowControllerAtIndex(index) as? AudioVideoRow
            let videoAux:Movie = value as! Movie
            row?.nome.setText(videoAux.videoName)
            
        }
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("moviewController", context: videos[rowIndex])
    }

}

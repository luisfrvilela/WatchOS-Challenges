//
//  AudioTableInterfaceController.swift
//  DesafioMochileiro
//
//  Created by Luis Filipe Resende Vilela on 17/03/16.
//  Copyright © 2016 Luis Filipe Resende Vilela. All rights reserved.
//

import WatchKit
import Foundation


class AudioTableInterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var saveUrl: NSURL?
    var audios: NSMutableArray = NSMutableArray()
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let fileManager = NSFileManager.defaultManager()
        let container = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.com.luis")
        saveUrl = container?.URLByAppendingPathComponent("audio\(actualFlag.flag.nameFlag)\(countAudio()).wav")
        self.populateAudio()
        self.mountTableRow()
    }


    @IBAction func gravarNovoAudio() {
        
        let duration = NSTimeInterval(10)
        let recordOptions = [WKAudioRecorderControllerOptionsMaximumDurationKey : duration]
        
        presentAudioRecorderControllerWithOutputURL(saveUrl!, preset: .NarrowBandSpeech, options: recordOptions, completion: { saved, erro in
            
            if let err = erro {
                print(err.description)
            }
            
        })
        actualFlag.audioList.addObject(Audio(_nome: "audio\(actualFlag.flag.nameFlag)\(self.countAudio()).wav", _pais: actualFlag.flag.nameFlag))
    }
    
    func countAudio()->Int {
        var retorno: Int = 1
        for audio in actualFlag.audioList {
            let aux = audio as! Audio
            if (aux.audioPais == actualFlag.flag.nameFlag) {
                retorno++
            }
  
        }
        
        return retorno
        
    }
    
    func populateAudio() {
        for audio in actualFlag.audioList {
            let aux = audio as! Audio
            if (aux.audioPais == actualFlag.flag.nameFlag) {
                audios.addObject(aux)
            }
        }
    }
    
    func mountTableRow() {
        self.table.setNumberOfRows(audios.count, withRowType: "row")
        
        for (index,value) in audios.enumerate() {
            let row = table.rowControllerAtIndex(index) as? AudioVideoRow
            let audioAux:Audio = value as! Audio
            row?.nome.setText(audioAux.audioName)
            
        }
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let audioUrl: Audio = self.audios[rowIndex] as! Audio
        self.playAudio(audioUrl)
        
    }
    
    
    func playAudio(audio:Audio) {
        print(audio.audioName)
        let fileManager = NSFileManager.defaultManager()
        let container = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.com.luis")
        let saveUrl:NSURL = (container?.URLByAppendingPathComponent(audio.audioName))!
        let playOptions = [WKAudioRecorderControllerOptionsMaximumDurationKey : "true"]
        presentMediaPlayerControllerWithURL(saveUrl, options:
            playOptions, completion: { didPlayToEnd, endTime, erro in
                
                if let err = erro {
                    print(err.description)
                }
                
        })
    
    }
    
}

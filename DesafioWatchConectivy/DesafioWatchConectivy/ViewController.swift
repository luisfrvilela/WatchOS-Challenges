//
//  ViewController.swift
//  DesafioWatchConectivy
//
//  Created by Luis Resende on 28/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var texfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var session:WCSession!
    var message = ""
    let arrayMessage : NSMutableArray = []
    var dictionaryMessages = NSMutableDictionary()
     var newMedia: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerNib(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier:MessageTableViewCell.reuseIdentifierMessageCell)

        if (WCSession.isSupported()){
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func send(sender: AnyObject) {
        self.view.endEditing(true)
        if self.texfield.text?.characters.count != 0 {
            //Necessário para retirar o "Optional"sds
            let arrayMessage = NSMutableArray()
            arrayMessage.addObject(self.texfield.text!)
            self.dictionaryMessages.setObject(UIColor.greenColor(), forKey: "Send"+self.texfield.text!)
            let dicionario  = ["dicionario": arrayMessage.firstObject!]
            session.sendMessage(dicionario, replyHandler: { (dict:[String:AnyObject]) in
            //
            }) { (NSError)in
                //
            }
            self.arrayMessage.addObject(self.texfield.text!)
            
            self.tableView.reloadData()
            self.texfield.text = ""
        }
    }
    
    @IBAction func useCameraRoll(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                //imagePicker.mediaTypes = [kUTTypeImage as NSString]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
        }
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        let dicionario = message["dicionario"] as! String
        dispatch_async(dispatch_get_main_queue()){
          self.arrayMessage.addObject(dicionario)
          self.dictionaryMessages.setObject(UIColor.whiteColor(), forKey: "Receive"+dicionario)
          self.tableView.reloadData()
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            self.arrayMessage.addObject(image)
            self.tableView.reloadData()
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60.0
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.arrayMessage.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let messageCell: MessageTableViewCell = tableView.dequeueReusableCellWithIdentifier(MessageTableViewCell.reuseIdentifierMessageCell, forIndexPath: indexPath) as! MessageTableViewCell
        
        let objectMessage = self.arrayMessage.objectAtIndex(indexPath.row)
        
        if objectMessage is String {
            messageCell.labelMessage.text = objectMessage as? String
        }else{
            messageCell.labelMessage.hidden = true
            messageCell.imageCell.hidden = false
            messageCell.imageCell.image = objectMessage as? UIImage
        }
        
        if let color = self.dictionaryMessages.objectForKey("Receive"+messageCell.labelMessage.text!) {
            messageCell.buttonBackground.backgroundColor = color as? UIColor
        }else if let color = self.dictionaryMessages.objectForKey("Send"+messageCell.labelMessage.text!){
            messageCell.buttonBackground.backgroundColor = color as? UIColor
        }
        
        return messageCell
    }
    
}

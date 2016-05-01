//
//  MessageTableViewCell.swift
//  DesafioWatchConectivy
//
//  Created by Luis Resende on 29/03/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMessage: UILabel!
    static let reuseIdentifierMessageCell: String = "MessageCell"
    @IBOutlet weak var buttonBackground: UIButton!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         //self.layer.cornerRadius = 25;
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

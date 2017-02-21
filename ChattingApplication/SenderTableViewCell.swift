//
//  SenderTableViewCell.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 20/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class SenderTableViewCell: UITableViewCell {

  
    @IBOutlet weak var sndrViewOutlt: UIView!
    @IBOutlet weak var SndrChatOutlt: UILabel!
    @IBOutlet weak var sndertimeOutlt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        sndertimeOutlt.text = "\(hour):" + "\(minutes)"
//        self.sndrViewOutlt.layer.cornerRadius = 3 //Exact half size of that UIView object's Height/Width
//        self.sndrViewOutlt.layer.masksToBounds = true

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

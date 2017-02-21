//
//  ReciverTableViewCell.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 20/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ReciverTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var RecivrViewOutlt: UIView!
    @IBOutlet weak var reciverChatOutlt: UILabel!
    @IBOutlet weak var RecivrTimeOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // let date = Date()
      //  let calendar = Calendar.current
      //  let hour = calendar.component(.hour, from: date)
      //  let minutes = calendar.component(.minute, from: date)
      //  RecivrTimeOutlet.text = "\(hour):" + "\(minutes)"
       // self.RecivrViewOutlt.layer.cornerRadius = 3 //Exact half size of that UIView object's Height/Width
       // self.RecivrViewOutlt.layer.masksToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

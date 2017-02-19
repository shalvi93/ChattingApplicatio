//
//  TableViewCell-2nd.swift
//  ChattingApplication
//
//  Created by Sierra 4 on 18/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ChatTableController: UITableViewCell {

    
    @IBOutlet weak var msgLbl1: UILabel!
    @IBOutlet weak var msgLbl2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

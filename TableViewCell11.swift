

//
//  TableViewCell11.swift
//  
//
//  Created by Sierra 4 on 17/02/17.
//
//

import UIKit
import Kingfisher

class TableViewCell11: UITableViewCell {

    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageF: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var Data : Details?
        {
        didSet
        {
            updateUI()
        }
        
    }
    fileprivate func updateUI()
    {
        
        imageF.kf.setImage(with: URL(string: (Data?.Image)!))
        chatLabel?.text = Data?.chatD
        nameLabel?.text = Data?.name
        timeLabel?.text =  Data?.time
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

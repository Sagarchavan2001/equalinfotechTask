//
//  listTableViewCell.swift
//  equalinfotech
//
//  Created by STC on 08/02/23.
//

import UIKit

class listTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    @IBOutlet weak var listview: UIView!
    
    @IBOutlet weak var proImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listview.layer.masksToBounds = true
        listview.layer.cornerRadius = 20    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

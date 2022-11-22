//
//  GreekRecipeCell.swift
//  Taste
//
//  Created by Sean Abuhoff on 11/21/22.
//

import UIKit

class GreekRecipeCell: UITableViewCell {

    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var grimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

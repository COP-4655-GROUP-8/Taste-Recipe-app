//
//  HomeCell.swift
//  Taste
//
//  Created by Rashawn Hill on 11/24/22.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var PhotoView: UIImageView!
    
    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBOutlet weak var RecipeLabel: UILabel!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MyRecipesCell.swift
//  Taste
//
//  Created by zach bundarin on 11/29/22.
//

import Parse
import UIKit

class MyRecipesCell: UITableViewCell {
    
    var objectId: String!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteRecipe(_ sender: Any) {
        let query = PFQuery(className: "Recipes")
        query.whereKey("objectId", equalTo: objectId!)
        query.findObjectsInBackground { recipes, error in
            if recipes != nil {
                for recipe in recipes ?? [] {
                    recipe.deleteEventually()
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            } else {
                print(error!)
            }
        }
    }
}

//
//  AppetizersTableViewController.swift
//  Taste
//
//  Created by Sean Abuhoff on 11/28/22.
//

import UIKit
import Parse
import Alamofire
import AlamofireImage

class AppetizersTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var appetizerstableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appetizerstableView.delegate = self
        appetizerstableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var recipeQuery = PFQuery(className:"Recipes")
        recipeQuery = recipeQuery.whereKey("category", equalTo: "Appetizer")
        recipeQuery.includeKeys(["author"])
        recipeQuery.order(byDescending: "createdAt")
        
        recipeQuery.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.appetizerstableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppetizersPostCell") as! AppetizersPostCell
        
        let postAuthor = post["author"] as? PFUser
            
        cell.authorLabel.text = postAuthor?.username
        cell.titleLabel.text = post["title"] as? String
        cell.categoryLabel.text = post["category"] as? String
        cell.instructionLabel.text = post["instructions"] as? String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        return cell
        
    }
}

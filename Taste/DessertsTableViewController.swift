//
//  DessertsTableViewController.swift
//  Taste
//
//  Created by Sean Abuhoff on 11/28/22.
//

import UIKit
import Parse
import Alamofire
import AlamofireImage

class DessertsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dessertstableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dessertstableView.delegate = self
        dessertstableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var recipeQuery = PFQuery(className:"Recipes")
        recipeQuery = recipeQuery.whereKey("category", equalTo: "Dessert")
        recipeQuery.order(byDescending: "createdAt")
        
        recipeQuery.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.dessertstableView.reloadData()
                print(self.posts)
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
        
        let post = posts[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertsPostCell") as! DessertsPostCell
        
        cell.authorLabel.text = post["author"] as? String
        cell.titleLabel.text = post["title"] as? String
        cell.categoryLabel.text = post["catgory"] as? String
        cell.instructionLabel.text = post["instructions"] as? String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        return cell
        
    }
}

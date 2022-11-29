//
//  HomeViewController.swift
//  Taste
//
//  Created by Rashawn Hill on 11/24/22.
//

import UIKit
import Parse
import AlamofireImage

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let myRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    var numberOfRecipes: Int!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        
        myRefreshControl.addTarget(self, action: #selector(viewDidAppear), for: .valueChanged)
        tableView.refreshControl = myRefreshControl

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        numberOfRecipes = 20
        let query = PFQuery(className: "Recipes")
        query.includeKeys(["author", "instructions", "title", "category"])
        query.limit = numberOfRecipes

        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts.removeAll()
                self.posts = posts!
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
            }
        }
    }
    
    
//    func loadMoreRecipes() {
//
//        numberOfRecipes = numberOfRecipes + 20
//        let query = PFQuery(className: "Recipes")
//        query.includeKeys(["author", "instructions", "title", "category"])
//        query.limit = numberOfRecipes
//
//        query.findObjectsInBackground { (posts, error) in
//            if posts != nil {
//                self.posts.removeAll()
//                self.posts = posts!
//                self.tableView.reloadData()
//                self.myRefreshControl.endRefreshing()
//            }
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row + 1 == posts.count {
//            loadMoreRecipes()
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]
        //let recipe = (post["recipe"] as? [PFObject]) ?? []
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
            
        //cell.title.text = user.username
        //cell.captionLabel.text = post["caption"] as? String
        cell.TitleLabel.text = post["title"] as? String
        cell.RecipeLabel.text = post["instructions"] as? String
        cell.CategoryLabel.text = post["category"] as? String
        
            
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
            
        cell.PhotoView.af_setImage(withURL: url)
        print(post)
        return cell
        
    }
    
    
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

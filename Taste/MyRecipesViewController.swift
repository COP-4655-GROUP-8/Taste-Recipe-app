//
//  MyRecipesViewController.swift
//  Taste
//
//  Created by zach bundarin on 11/21/22.
//

import UIKit
import Parse

class MyRecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipes = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Recipes")
        query.whereKey("author", equalTo: PFUser.current()!)
        query.includeKeys(["author", "title"])
        query.limit = 20
        
        query.findObjectsInBackground { recipes, error in
            if recipes != nil {
                self.recipes = recipes!
                self.tableView.reloadData()
                print(self.recipes)
            } else {
                print(error!)
            }
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRecipesCell") as! MyRecipesCell
        
        cell.recipeTitleLabel.text = (recipe["title"] as! String)
        cell.objectId = recipe.objectId
            
        return cell
    }
    
    @objc func loadList(notification: NSNotification){
        let query = PFQuery(className: "Recipes")
        query.whereKey("author", equalTo: PFUser.current()!)
        query.includeKeys(["author", "title"])
        query.limit = 20
        
        query.findObjectsInBackground { recipes, error in
            if recipes != nil {
                self.recipes = recipes!
                self.tableView.reloadData()
                print(self.recipes)
            } else {
                print(error!)
            }
        }
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

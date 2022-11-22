//
//  RecipeViewController.swift
//  Taste
//
//  Created by Sean Abuhoff on 11/20/22.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewA: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewA.dataSource = self
        tableViewA.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
        //return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //let recipe = recipes[indexPath.row]
        //let name = recipe["name"] as! String
        
        return cell
    }
}

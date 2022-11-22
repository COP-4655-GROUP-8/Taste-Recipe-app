//
//  AsianRecipeViewController.swift
//  Taste
//
//  Created by Sean Abuhoff on 11/21/22.
//

import UIKit

class AsianRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var asiantableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        asiantableView.dataSource = self
        asiantableView.delegate = self
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

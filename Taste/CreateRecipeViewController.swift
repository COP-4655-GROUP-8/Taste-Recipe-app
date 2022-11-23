//
//  CreateRecipeViewController.swift
//  Parstagram
//
//  Created by zach bundarin on 11/22/22.
//

import UIKit
import AlamofireImage
import Parse

class CreateRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var instructionField: UITextView!
    @IBOutlet weak var categorySelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let recipe = PFObject(className: "Recipes")
        
        recipe["title"] = titleField.text!
        recipe["instructions"] = instructionField.text!
        recipe["category"] = getSegmentController()
        recipe["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        recipe["image"] = file
        
        recipe.saveInBackground { success, error in
            if success {
                print("Saved!")
                self.dismiss(animated: true)
            } else {
                print("Error!")
            }
        }
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func getSegmentController() -> String {
        if(categorySelector.selectedSegmentIndex == 0)
        {
            return "Appetizer"
        }
        else if(categorySelector.selectedSegmentIndex == 1)
        {
            return "Entree"
        }
        else if(categorySelector.selectedSegmentIndex == 2)
        {
            return "Dessert"
        }
        else if(categorySelector.selectedSegmentIndex == 3)
        {
            return "Drink"
        }
        return "Other"
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

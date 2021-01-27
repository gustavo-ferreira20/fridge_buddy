//
//  AddItemViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/27.
//

import UIKit

class AddItemViewController: UIViewController {

  
    @IBOutlet weak var ingredientsTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adding borders to textfield
        textFieldBorder()
        
        addButton.layer.cornerRadius = 6

    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addPressed(_ sender: UIButton) {
    }
    
    func textFieldBorder(){
        let myColor = UIColor.orange
           ingredientsTextfield.layer.borderColor = myColor.cgColor
           quantityTextfield.layer.borderColor = myColor.cgColor

           ingredientsTextfield.layer.borderWidth = 1.0
           quantityTextfield.layer.borderWidth = 1.0
        
        ingredientsTextfield.layer.cornerRadius = 4
        quantityTextfield.layer.cornerRadius = 6
    }


}

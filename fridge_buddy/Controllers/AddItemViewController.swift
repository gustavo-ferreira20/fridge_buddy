//
//  AddItemViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/27.
//

import UIKit

protocol AddIngredientDelegate {
    func addIngredient(ing: Ingredients)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddIngredientDelegate?

  
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
        guard let name = ingredientsTextfield.text, ingredientsTextfield.hasText else{
            print("Handle error here..")
            return
        }
        
        guard let quantity = quantityTextfield.text, quantityTextfield.hasText else{
            print("Handle error here..")
            return
        }
        
        let ingredient = Ingredients(name: name, quantity: quantity)
        delegate?.addIngredient(ing: ingredient)
        print(ingredient.name)
        print(ingredient.quantity)
        
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

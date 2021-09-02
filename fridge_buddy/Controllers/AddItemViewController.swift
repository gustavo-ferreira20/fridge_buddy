//
//  AddItemViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/27.
//

import UIKit
import iOSDropDown


protocol AddIngredientDelegate {
    func addIngredient(ing: Ingredients)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddIngredientDelegate?
    

  
    @IBOutlet weak var ingredientsTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var measurementMenu: DropDown!
    @IBOutlet weak var addButton: UIButton!
    
    
    let measures = Measures().measuresOptions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adding borders to textfield
        textFieldBorder(ingredientText: ingredientsTextfield, quantity: quantityTextfield)
        
        addButton.layer.cornerRadius = 6
        dropDownDetails(menu: measurementMenu, options: measures)
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
        
        guard let measurement = measurementMenu.text, measurementMenu.hasText else{
            print("Handle error here..")
            return
        }
        
        let ingredient = Ingredients(name: name, quantity: quantity, measure: measurement)
        delegate?.addIngredient(ing: ingredient)
        
        print(ingredient.name)
        print(ingredient.quantity)
        print(ingredient.measure)
        
    }
    

    func textFieldBorder(ingredientText: UITextField, quantity: UITextField){
        let myColor = UIColor.orange
           ingredientText.layer.borderColor = myColor.cgColor
           quantity.layer.borderColor = myColor.cgColor

           ingredientText.layer.borderWidth = 1.0
           quantity.layer.borderWidth = 1.0
        
        ingredientText.layer.cornerRadius = 4
        quantity.layer.cornerRadius = 6
    }
    

    
    func dropDownDetails(menu: DropDown, options: [String]){
        menu.optionArray = options
        menu.selectedRowColor = UIColor.orange
        menu.borderColor = UIColor.orange
        menu.cornerRadius = 6
    }


}

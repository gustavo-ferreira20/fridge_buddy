//
//  EditViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/1.
//

import UIKit
import iOSDropDown

class EditViewController: UIViewController {
    
    @IBOutlet weak var ingredientsTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var measurementMenu: DropDown!
    @IBOutlet weak var updateButton: UIButton!
    
    
    
    
    var ingName: String?
    var ingDesc: String?
    var ingMeas: String?
    let measures = Measures().measuresOptions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTextfield.text = ingName
        quantityTextfield.text = ingDesc
        measurementMenu.text = ingMeas
        
        AddItemViewController().dropDownDetails(menu: measurementMenu, options: measures )
        AddItemViewController().textFieldBorder(ingredientText: ingredientsTextfield, quantity: quantityTextfield)
        updateButton.layer.cornerRadius = 6
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    
    @IBAction func updatePressed(_ sender: Any) {
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
        
        print(ingredient)
    }


}





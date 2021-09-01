//
//  EditViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/1.
//

import UIKit

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var ingredientTitle: UILabel!
    @IBOutlet weak var ingredientDescription: UILabel!
    
    var ingName: String?
    var ingDesc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientTitle.text = ingName
        ingredientDescription.text = ingDesc
    }
    
}







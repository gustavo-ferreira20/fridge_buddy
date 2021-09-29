//
//  SingleIngredientViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/28.
//

import UIKit

class SingleRecipeViewController: UIViewController {
    let recipeApiManager = RecipeAPIManager()
    
    // URL of the Ingredient clicked in the Cell
    var singleIngURL = ""
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeApiManager.performRequestForSingleRecipe(urlString: singleIngURL){
            DispatchQueue.main.async {
                self.didUpdateRecipe()
            }
        }
        print("Single Ingredient URL: \(singleIngURL)")
        // Do any additional setup after loading the view.
    }
    

 
    func didUpdateRecipe(){
        self.testLabel.text = self.recipeApiManager.recipe?.title
    }
    

}

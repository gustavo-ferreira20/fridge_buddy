//
//  RecipesViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/23.
//

import UIKit

class RecipesViewController: UITableViewController {
    
    var recipeApiManager = RecipeAPIManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        recipeApiManager.delegate = self
        // Do any additional setup after loading the view.
    }
    


//    MARK - Tableview Datasource Methods

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
////
////        cell.textLabel?.text = ingredients?[indexPath.row].name ?? " No Ingredients added yet"
////        cell.detailTextLabel?.text = ingredients![indexPath.row].quantity  + " "  + ingredients![indexPath.row].measure
////
////
////
////
////        return cell
//    }
//
//    // MARK - TableView Delegate Methods
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        Obtain all cell info by clicking here
////        print(ingredients![indexPath.row])
////        print(ingredients![indexPath.row].name)
////
////        myIndex = indexPath.row
////        tableView.deselectRow(at: indexPath, animated: true)
////
////        self.performSegue(withIdentifier: "editSegue", sender: self)
//
//
//    }
    
    func updateRecipe(recipe: [RecipeModel]){
        print(recipe[0].recipeTitle)
    }
}

extension RecipesViewController: RecipeManagerDelegate{
    func didUpdateRecipe(recipe: [RecipeModel]) {
//        print(recipe[0].recipeTitle)
    }
    
    
}

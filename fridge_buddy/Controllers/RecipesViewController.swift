//
//  RecipesViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/23.
//

import UIKit



class RecipesViewController: UITableViewController {
    
    var recipeApiManager = RecipeAPIManager()
    var recipesList = [RecipeModel]()
    var listCount = Int()
    
    var numTest = Int()
    var instance: HomepageController?
    var passString: String?
  
    
    @IBOutlet weak var labelTest: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTest?.text = passString
        print("testing")
        // Do any additional setup after loading the view.
    }
    
    
    
//        MARK - Tableview Datasource Methods
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return listCount
        }
    //
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recipeTitles", for: indexPath)

//            cell.textLabel?.text = recipesList[indexPath.row].recipeTitle
            cell.textLabel?.text = recipesList[indexPath.row].recipeTitle

            return cell
        }
    
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
        print(recipe)

    }
    
    func testing(word: String){
        print("Printed from VC: \(word)")
    }
    
   
    func addingNum(){
        numTest = 6
    }
    
//    func upadteLabel(recipe: [RecipeModel]){
//
//        labelTest.text = recipe[0].recipeTitle
//    }
    
  
    
}

extension RecipesViewController: RecipeApiManagerDelegate{
    func getRecipesArray(recipe: [RecipeModel]) {
        print(recipe)
    }
   
}

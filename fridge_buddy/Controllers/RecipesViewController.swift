//
//  RecipesViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/23.
//

import UIKit



class RecipesViewController: UIViewController  {
    
    
    var recipeApiManager = RecipeAPIManager()
    var recipesList = [RecipeData]()

  
    var ingredientsString = ""
    var cellId = Int()
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
//        Testing if the cell ID is saved
        print(cellId)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        tableview.delegate = self
        tableview.dataSource = self
        
        recipeApiManager.performRequest(urlString: ingredientsString) {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    

       
}

 
extension RecipesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return recipeApiManager.recipesArray.count
        return recipesCount(recipesArray: recipeApiManager.recipesArray)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        if recipeApiManager.recipesArray[indexPath.row].missedIngredientCount == 0 {
//            cell.textLabel?.text = recipeApiManager.recipesArray[indexPath.row].title
//        }
        cell.textLabel?.text = recipesTitle(recipesArray: recipeApiManager.recipesArray)[indexPath.row]
        
        if let likes = recipeApiManager.recipesArray[indexPath.row].likes{
            cell.detailTextLabel?.text = String(likes) + "❤️"
        }else{
            cell.detailTextLabel?.text = "-"
        }

        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Obtain all cell info by clicking here
//       Getting each cell ID upon click -- Use this Id to fetch the full Recipe Info by Using URL/ID
       cellId = recipeApiManager.recipesArray[indexPath.row].id

    }
    
    
//    Returning the count of elements of recipes's array that matches the requirement missedIngredientCount < 2(could be 1 too)
    func recipesCount(recipesArray: [RecipeData]) -> Int{
        var count = Int()
        var array = [String]()
        
        for i in recipesArray {
            if i.missedIngredientCount == 0{
                let titles = i.title
                array.append(titles)
            }
        }
        count = array.count
        return count
    }
    
//Returning all Titles according to missedIngredientsCount
    func recipesTitle(recipesArray: [RecipeData]) -> [String]{
        var array = [String]()
        
        for i in recipesArray {
            if i.missedIngredientCount == 0{
                let titles = i.title
                array.append(titles)
            }
        }
        
        return array
    }
    

}


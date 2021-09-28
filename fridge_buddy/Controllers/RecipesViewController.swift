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
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return recipeApiManager.recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = recipeApiManager.recipesArray[indexPath.row].title
        return cell
    }
}


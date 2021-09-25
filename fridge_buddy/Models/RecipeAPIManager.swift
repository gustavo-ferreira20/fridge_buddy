//
//  RecipeAPIManager.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/15.
//

import UIKit

protocol RecipeApiManagerDelegate {
    func getRecipesArray(recipe: [RecipeModel])
}

class RecipeAPIManager {
    let recipeURL = "https://api.spoonacular.com/recipes/findByIngredients?number=10&ranking=2"
    let apiKey = "9d96afec84a54537a834cbbcf234f9b2"
    
    var test = String()
    var recipes = [RecipeModel]()
    var n = Int()
    
    var delegate: RecipeApiManagerDelegate?
    
    func fetchRecipes(ingredientsName: String){
        let urlString = "\(recipeURL)&ingredients=\(ingredientsName)&apiKey=\(apiKey)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    
    func performRequest(urlString: String){
        //1. Create a URL

        if let url = URL(string: urlString){
            //2. Create a URLSession

            let session = URLSession(configuration: .default)

            //3. Give the session a task

            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("ERROR IN THE API HANDLER")
                    print(error!)
                    return
                }

                if let safeData = data{
                    // Converting DATA to a STRING
                    // dataString is all data fetched from the api web server
                    //                    let dataString = String(data: safeData, encoding: .utf8)
                    //                    print(dataString!)
                    if let eachRecipe = self.parseJson(recipeData: safeData){
                        DispatchQueue.main.async {
//                               do UIWork here
                            self.numTest(no: 7)
                            self.newTest(word: "cccc")
                            let recipeVC = RecipesViewController()
                            recipeVC.getRecipesArray(recipe: eachRecipe)
//                            recipeVC.testing(word: self.test)

                        }

                    }

                }
            }

            //4. Start the task
            task.resume()
        }

    }
    
    
    func parseJson(recipeData: Data) -> [RecipeModel]? {
        let decoder = JSONDecoder()
        var recipe = [RecipeModel]()
        

        do{
            let decodedData = try decoder.decode([RecipeData].self, from: recipeData )

            //            decodedData.forEach { title in print(title)}
            for i in decodedData{
                //                        print(i.title + " //ID: " + String(i.id) + " // Missed Ing: " + String(i.missedIngredientCount) )
                let title = i.title
                let id = i.id

                let eachRecipe = RecipeModel(recipeId: id, recipeTitle: title)
                recipe.append(eachRecipe)
//                print("\(): \(recipe!.recipeTitle)")
                //                        for n in i.usedIngredients{
                //                            print("Used Ing Name: " + n.name + " //Used Ing Unit: " + n.unit + " //Used Ing Amount: " + String(n.amount))
                //
                //                        }
                //                        print("==========")
            }
 //           let listCount = recipe.index(before: recipe.count + 1)// Array length

            return recipe

            //            DecoddeData is the array to have all cell in the table view
        } catch{
            print("Error in the decoder")
            print(error)
            return nil
        }
    }
    
    func newTest(word: String){
        test = word
    }
    

    func numTest(no: Int){
        n = no
    }
    
    func random() -> [Int]{
        return [1,5,6,9]
    }
    

}


//
//  RecipeAPIManager.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/15.
//

import UIKit



class RecipeAPIManager {

    var recipesArray = [RecipeData]()
    
    
    func performRequest(urlString: String, completed: @escaping () -> ()){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession.shared

            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("ERROR IN THE API HANDLER")
                    print(error!)
                    return
                }
                // deal with the data
                let decoder = JSONDecoder()
                do{
                    self.recipesArray = try decoder.decode([RecipeData].self, from: data! )
                    
//                    print("Here is my data \(self.recipesArray)")
                }
                catch {
                    print("Error in the decoder")
                    print(error)
                }
                completed()
            }

            //4. Start the task
            task.resume()
        }

    }
    
    // ======Function stopped here
    
    
//    func parseJson(recipeData: Data) -> [RecipeModel]? {
//        let decoder = JSONDecoder()
//        var recipe = [RecipeModel]()
//        
//
//        do{
//            let decodedData = try decoder.decode([RecipeData].self, from: recipeData )
//
//            for i in decodedData{
//
//                let title = i.title
//                let id = i.id
//
//                let eachRecipe = RecipeModel(recipeId: id, recipeTitle: title)
//                recipe.append(eachRecipe)
//            }
// 
//            return recipe
//
//        } catch{
//            print("Error in the decoder")
//            print(error)
//            return nil
//        }
//    }
//    


}


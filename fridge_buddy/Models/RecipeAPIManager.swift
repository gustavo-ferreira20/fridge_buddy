//
//  RecipeAPIManager.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/15.
//

import UIKit



class RecipeAPIManager {

    var recipesArray = [RecipeData]()
    var recipe: SingleRecipeData?
    
    
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
    
    
    
    // Request Data from APi for a Single Recipe
    
    
    func performRequestForSingleRecipe(urlString: String, completed: @escaping () -> ()){
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
                do{
                    self.recipe = try JSONDecoder().decode(SingleRecipeData.self, from: data!)
                } catch{
                    print("Error in the decoder")
                    print(error)
                }
                completed()
                
                }
            

            //4. Start the task
            task.resume()
        }

    }
    
    
    


}


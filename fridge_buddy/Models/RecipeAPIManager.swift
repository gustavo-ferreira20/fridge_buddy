//
//  RecipeAPIManager.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/15.
//

import Foundation

struct RecipeAPIManager {
    let recipeURL = "https://api.spoonacular.com/recipes/findByIngredients?number=10&ranking=2"
    let apiKey = "9d96afec84a54537a834cbbcf234f9b2"
    
    func fetchRecipes(ingredientsName: String){
        let urlString = "\(recipeURL)&ingredients=\(ingredientsName)&apiKey=\(apiKey)"
        performRequest(urlString: urlString)
//        print(urlString)
        
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
           let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print("ERROR IN THE API HANDLER")
            print(error!)
            return
        }
        
        if let safeData = data{
//            Converting DATA to a STRING
//            dataString is all data fetched from the api web server
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }

}

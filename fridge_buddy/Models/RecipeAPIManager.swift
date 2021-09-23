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
                    parseJson(recipeData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJson(recipeData: Data){
        let decoder = JSONDecoder()
        do{
           let decodedData = try decoder.decode([RecipeData].self, from: recipeData )

            fetchingDataApi(decodedData: decodedData)

        } catch{
            print("Error in the decoder")
            print(error)
        }
    }
    
//    Using the Struct RecipeData to fetch all needed field from API
    func fetchingDataApi(decodedData: [RecipeData]) {
        //            decodedData.forEach { title in print(title)}
                    for i in decodedData{
                        print(i.title + " //ID: " + String(i.id) + " // Missed Ing: " + String(i.missedIngredientCount) )
                        for n in i.usedIngredients{
        //                    print("Used Ing Name: " + n.name + " //Used Ing Unit: " + i.usedIngredients[0].unit + " //Used Ing Amount: " + String(i.usedIngredients[0].amount))
                            print("Used Ing Name: " + n.name + " //Used Ing Unit: " + n.unit + " //Used Ing Amount: " + String(n.amount))
                            
                        }
                        print("==========")
                        
                    }
        
    }

}

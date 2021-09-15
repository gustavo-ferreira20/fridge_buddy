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
        
        print(urlString)
    }
}

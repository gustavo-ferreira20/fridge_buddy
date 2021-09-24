//
//  RecipeData.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/23.
//

import Foundation

struct RecipeData: Codable {
    let title: String
    let id: Int
    let missedIngredientCount: Int
    let usedIngredients: [UsedIngredients]
}

struct UsedIngredients: Codable{
    let unit: String
    let amount: Double
    let name: String
}


// 0.usedIngredients[0].unit
//1.missedIngredients[0].unit
//1.missedIngredients[0].amount

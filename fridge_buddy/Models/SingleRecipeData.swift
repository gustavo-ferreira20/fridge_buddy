//
//  SingleRecipeData.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/29.
//

import Foundation

struct SingleRecipeData: Codable{
    let title: String
    let servings: Int
    let image: String
    let summary: String
    let instructions: String
}

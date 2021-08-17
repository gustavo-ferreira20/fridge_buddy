//
//  IngredientsModel.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/2/1.
//

import Foundation
import RealmSwift


class Ingredients: Object {
    @Persisted var name: String
    @Persisted var quantity: String
    @Persisted var measure: String
    
   convenience init(name : String, quantity : String, measure: String) {
        self.init()
        
        self.name = name
        self.quantity = quantity
        self.measure = measure
    }
}

//
//  RecipeResponse.swift
//  RecipeApp
//
//  Created by Mañanas on 13/6/25.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable {
    let id: Int64
    let name: String
    let image: String
    let instructions: [String]
    let ingredients: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let servings: Int
    let difficulty: String
    let cuisine: String
    let rating: Float
}

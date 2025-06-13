//
//  RecipeProvider.swift
//  RecipeApp
//
//  Created by Mañanas on 13/6/25.
//

import Foundation

class RecipeProvider {
    
    static func findRecipesByName(query: String) async -> [Recipe] {
        let url = URL(string: "https://dummyjson.com/recipes/search?q=\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(RecipeResponse.self, from: data)
            
            return result.recipes
        } catch {
            print(error)
            return []
        }
    }
    
}

/*enum ResponseError: Error {
    case invalidUrl
    case connectionError
    case jsonDecodingError
}*/

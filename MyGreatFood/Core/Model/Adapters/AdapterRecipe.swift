//
//  AdapterRecipe.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

extension Recipe {
    init(_ response: RecipeResponse) {
        id = response.id
        title = response.title
        readyInMinutes = response.readyInMinutes
        image = response.image
        instructions = response.instructions
    }
}

extension Array where Element == Recipe {
    init(recipe: [RecipeResponse]) {
        self = recipe.map(Recipe.init)
    }
}

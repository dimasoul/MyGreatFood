//
//  RecipeRequest.swift
//  MyGreatFood
//
//  Created by Дмитрий on 16.12.2022.
//

import Foundation

struct RecipeRequest: Request {
    var baseURL: String = "https://api.spoonacular.com/"
    var path: String = "recipes/random?"
    var key: String = "apiKey=f9fe3370185540b8b5ecf328e243ecbc&number=20"
}


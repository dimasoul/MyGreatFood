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
}


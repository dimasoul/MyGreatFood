//
//  RecipeAPI.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

// MARK: - Recipe
struct RecipeResponse: Codable {
    var vegetarian: Bool?
    var vegan: Bool?
    var glutenFree: Bool?
    var dairyFree: Bool?
    var veryHealthy: Bool?
    var cheap: Bool?
    var veryPopular: Bool?
    var sustainable: Bool?
    var lowFodmap: Bool?
    var weightWatcherSmartPoints: Int?
    var gaps: String?
    var preparationMinutes: Int?
    var cookingMinutes: Int?
    var aggregateLikes: Int?
    var healthScore: Int?
    var creditsText: String?
    var license: String?
    var sourceName: String?
    var pricePerServing: Double?
    var extendedIngredients: [ExtendedIngredientAPI]?
    var id: Int?
    var title: String?
    var readyInMinutes: Int?
    var servings: Int?
    var sourceUrl: String?
    var image: String?
    var imageType: String?
    var summary: String?
    var cuisines: [String]?
    var dishTypes: [String]?
    var diets: [String]?
    var occasions: [String]?
    var instructions: String?
    var analyzedInstructions: [AnalyzedInstructionAPI]?
    var spoonacularSourceUrl: String?

}

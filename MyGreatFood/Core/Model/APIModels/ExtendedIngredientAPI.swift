//
//  ExtendedIngredientAPI.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

struct ExtendedIngredientAPI: Codable {
    var id: Int?
    var aisle: String?
    var image: String?
    var consistency: ConsistencyAPI?
    var name: String?
    var nameClean: String?
    var original: String?
    var originalName: String?
    var amount: Double?
    var unit: String?
    var meta: [String]?
    var measures: MeasuresAPI?
}

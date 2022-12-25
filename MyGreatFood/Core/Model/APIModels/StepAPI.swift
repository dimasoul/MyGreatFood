//
//  Step.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

struct StepAPI: Codable {
    var number: Int?
    var step: String?
    var ingredients: [IngredientsAPI]?
    var equipment: [IngredientsAPI]?
    var length: LengthAPI?
}

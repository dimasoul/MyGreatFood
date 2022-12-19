//
//  Recipe.swift
//  MyGreatFood
//
//  Created by Дмитрий on 17.12.2022.
//

import Foundation

struct Recipe: Equatable {
    var id: Int?
    var title: String?
    var readyInMinutes: Int?
    var image: String?
    var instructions: String?
}

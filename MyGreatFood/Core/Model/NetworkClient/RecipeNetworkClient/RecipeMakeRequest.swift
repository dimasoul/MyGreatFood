//
//  RecipeMakeRequest.swift
//  MyGreatFood
//
//  Created by Дмитрий on 21.12.2022.
//

import Foundation

extension NetworkService {
    func makeRecipeRequest(completion: (Result<FoodAPI, Error>) -> Void) {
        guard let urlString = URLRequest.init(request: RecipeRequest) else { return }
        makeRequest<FoodAPI>(url: urlString) { result in
            completion(.success(result))
            }
        
    }
}

//
//  NetworkService.swift
//  MyGreatFood
//
//  Created by Дмитрий on 02.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRecipe(completion: @escaping (Result<Food?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getRecipe(completion: @escaping (Result<Food?, Error>) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/random?apiKey=f9fe3370185540b8b5ecf328e243ecbc&number=20"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try? JSONDecoder().decode(Food.self, from: data!)
                completion(.success(obj))
                print(obj)
                
            } catch {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}

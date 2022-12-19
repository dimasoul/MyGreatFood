//
//  NetworkService.swift
//  MyGreatFood
//
//  Created by Дмитрий on 02.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRecipe(completion: @escaping (Result<FoodAPI?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
//    private let keyChainStorage: String
//    init(keyChainStorage: String) {
//        self.keyChainStorage = keyChainStorage
//    }
    
    
    func getRecipe(completion: @escaping (Result<FoodAPI?, Error>) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/random?apiKey=f9fe3370185540b8b5ecf328e243ecbc&number=20"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let data = try? JSONDecoder().decode(FoodAPI?.self, from: data!)
                completion(.success(data))
                print(data)
                
            } catch {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}

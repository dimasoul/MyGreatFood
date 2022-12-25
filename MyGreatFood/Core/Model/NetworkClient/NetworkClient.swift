//
//  NetworkClient.swift
//  MyGreatFood
//
//  Created by Дмитрий on 02.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func makeRequest<T: Decodable>(url: Request, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    private let keyChainStorage: String
    init(keyChainStorage: String) {
        self.keyChainStorage = keyChainStorage
    }
    
    func makeRequest<T: Decodable>(url: Request, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URLRequest(request: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data = try? JSONDecoder().decode(T.self, from: data!) else { return }
                completion(.success(data))
                print(data)
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


  

//import Foundation
//
//protocol NetworkServiceProtocol {
//    func makeRequest(сompletion: @escaping (Result<FoodAPI, Error>) -> Void)
//}
//
//final class NetworkService: NetworkServiceProtocol {
//
//    func makeRequest(сompletion completion: @escaping (Result<FoodAPI, Error>) -> Void) {
//        let urlString = "https://api.spoonacular.com/recipes/random?apiKey=f9fe3370185540b8b5ecf328e243ecbc&number=20"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            do {
//                guard let data = try? JSONDecoder().decode(FoodAPI?.self, from: data!) else { return }
//                completion(.success(data))
//                print(data)
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}


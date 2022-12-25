//
//  MainPresenter.swift
//  MyGreatFood
//
//  Created by Дмитрий on 30.11.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getRecipe()
    var recipes: FoodAPI? { get set }
}
    
class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var recipes: FoodAPI?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getRecipe()
    }
    
    func getRecipe() {
        networkService.makeRequest { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let recipes):
                    self.recipes = recipes
                    self.view?.success()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}

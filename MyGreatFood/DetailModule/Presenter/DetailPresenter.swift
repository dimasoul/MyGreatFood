//
//  DetailPresenter.swift
//  MyGreatFood
//
//  Created by Дмитрий on 05.12.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setRecipe(recipe: Recipe?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, recipe: Recipe?)
    func setRecipe()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var recipe: Recipe?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, recipe: Recipe?) {
        self.view = view
        self.networkService = networkService
        self.recipe = recipe
    }
    
    public func setRecipe() {
        self.view?.setRecipe(recipe: recipe)
    }
    
}

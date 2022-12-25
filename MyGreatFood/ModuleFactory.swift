//
//  ModuleBuilder.swift
//  MyGreatFood
//
//  Created by Дмитрий on 01.12.2022.
//

import UIKit

protocol Factory {
    static func createMainModule() -> UIViewController
    static func createDetailModule(recipe: RecipeResponse?) -> UIViewController}

class ModelFactory: Factory {

    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService(keyChainStorage: <#String#>)
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(recipe: RecipeResponse?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService(keyChainStorage: <#String#>)
        let presenter = DetailPresenter(view: view, networkService: networkService, recipe: recipe)
        view.presenter = presenter
        return view
    }
}

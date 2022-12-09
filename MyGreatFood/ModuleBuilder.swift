//
//  ModuleBuilder.swift
//  MyGreatFood
//
//  Created by Дмитрий on 01.12.2022.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(recipe: Recipe?) -> UIViewController}

class ModelBuilder: Builder {

    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(recipe: Recipe?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, recipe: recipe)
        view.presenter = presenter
        return view
    }
}

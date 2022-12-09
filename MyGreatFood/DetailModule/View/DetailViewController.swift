//
//  DetailViewController.swift
//  MyGreatFood
//
//  Created by Дмитрий on 05.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setRecipe()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setRecipe(recipe: Recipe?) {
        recipeLabel.text = recipe?.instructions
    }
    
    
}
 

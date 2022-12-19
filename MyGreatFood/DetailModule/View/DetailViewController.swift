//
//  DetailViewController.swift
//  MyGreatFood
//
//  Created by Дмитрий on 05.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setRecipe()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setRecipe(recipe: RecipeResponse?) {
        recipeLabel.text = recipe?.instructions
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: recipe?.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                    
            DispatchQueue.main.async {
                self.imageRecipe.image = UIImage(data: imageData)
            }
        }
    }
}

//
//  MainTableViewCell.swift
//  MyGreatFood
//
//  Created by Дмитрий on 12.12.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var textTitleFood: UILabel!
    @IBOutlet weak var textReadyFood: UILabel!
    @IBOutlet weak var viewMain: UIView!
    
    private func setupView() {
        viewMain.layer.cornerRadius = 15
        imageFood.layer.cornerRadius = 30
        }
        
        func configure(food: RecipeResponse?) {
            guard let username = food?.readyInMinutes else {
                return
            }
            textTitleFood?.text = food?.title
            textReadyFood.text = "Cooking time \(username) min"
            setupView()
            
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: food?.image ?? "") else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    self.imageFood.image = UIImage(data: imageData)
                }
            }
        }
    }

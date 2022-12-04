//
//  ViewController.swift
//  MyGreatFood
//
//  Created by Дмитрий on 30.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableViewRecipe: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewRecipe.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.recipes?.recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let recipe = presenter.recipes?.recipes?[indexPath.row]
        cell.textLabel?.text = recipe?.title
        return cell
    }
    
}

extension MainViewController: MainViewProtocol {
    func success() {
        tableViewRecipe.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    

    
    
}

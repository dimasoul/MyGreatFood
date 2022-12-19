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
        //tableViewRecipe.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableViewRecipe.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableViewRecipe.rowHeight = 150
        self.title = "Tasty Recipes"
        tableViewRecipe.delegate = self
        tableViewRecipe.dataSource = self
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.recipes?.recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        let recipe = presenter.recipes?.recipes?[indexPath.row]
        cell.configure(food: recipe)
        //cell.textLabel?.text = recipe?.title
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let recipe = presenter.recipes?.recipes?[indexPath.row]
        let detailViewController = ModelBuilder.createDetailModule(recipe: recipe)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     //   150
    //}
}

extension MainViewController: MainViewProtocol {
    func success() {
        tableViewRecipe.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    

    
    
}

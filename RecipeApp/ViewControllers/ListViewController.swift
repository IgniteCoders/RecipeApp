//
//  ViewController.swift
//  RecipeApp
//
//  Created by Mañanas on 13/6/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        searchRecipes(query: "")
    }
    
    func searchRecipes(query: String) {
        Task {
            recipes = await RecipeProvider.findRecipesByName(query: query)
            tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchRecipes(query: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchRecipes(query: "")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeViewCell
        let recipe = recipes[indexPath.row]
        cell.render(with: recipe)
        return cell
    }

}


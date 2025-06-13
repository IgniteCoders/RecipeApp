//
//  DetailViewController.swift
//  RecipeApp
//
//  Created by Mañanas on 13/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var dificultyLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        recipeImageView.layer.cornerRadius = 16
        navigationItem.title = recipe.name
        
        recipeImageView.loadFrom(url: recipe.image)
        instructionsTextView.text = recipe.instructions.joined(separator: "\n")
        ingredientsTextView.text = recipe.ingredients.joined(separator: "\n")
        
        prepTimeLabel.text = recipe.prepTimeMinutes.description
        cookTimeLabel.text = recipe.cookTimeMinutes.description
        servingsLabel.text = recipe.servings.description
        
        cuisineLabel.text = recipe.cuisine
        dificultyLabel.text = recipe.difficulty
        dificultyLabel.textColor = switch recipe.difficulty {
            case "Easy":
                .systemGreen
            case "Medium":
                .systemOrange
            default:
                .systemRed
        }
        
        ratingLabel.text = recipe.rating.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

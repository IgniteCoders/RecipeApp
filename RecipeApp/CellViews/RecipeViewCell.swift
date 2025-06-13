//
//  RecipeViewCell.swift
//  RecipeApp
//
//  Created by Mañanas on 13/6/25.
//

import UIKit

class RecipeViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    func render(_ recipe: Recipe) {
        recipeNameLabel.text = recipe.name
        recipeImageView.loadFrom(url: recipe.image)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        recipeImageView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//
//  PokemonCell.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/26/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import UIKit

/// Custom UICollectionViewCell for pokemon image and name
class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 7.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLabel.text = pokemon.name.capitalized
        thumbImg.image = UIImage(named: String(pokemon.pokedexId))
    }
    
}

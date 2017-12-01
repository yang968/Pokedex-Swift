//
//  PokemonViewController.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/28/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokeIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeIdLabel.text = String(pokemon.pokedexId)
        nameLabel.text = pokemon.name.capitalized
        
        mainImage.image = UIImage(named: String(pokemon.pokedexId))

        pokemon.downloadDescription {
            self.updateDescription()
        }
        pokemon.downloadPokemonInfo {
            // Will be called after the network call is completed
            print("I'm here")
            self.updateStats()
        }
    }
    
    func updateDescription() {
        descLabel.text = pokemon.description
    }
    
    func updateStats() {
        attackLabel.text = pokemon.attack
        defLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

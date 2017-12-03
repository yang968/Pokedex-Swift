//
//  PokemonViewController.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/28/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        
        hideUI()
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.pokemon.downloadPokemonInfo {
            self.updateStats()
            self.updateDescription()
            self.showUI()
            SVProgressHUD.dismiss()
        }
    }
    
    func hideUI() {
        descLabel.isHidden = true
        typeLabel.isHidden = true
        defLabel.isHidden = true
        heightLabel.isHidden = true
        pokeIdLabel.isHidden = true
        weightLabel.isHidden = true
        attackLabel.isHidden = true
    }
    
    func showUI() {
        descLabel.isHidden = false
        typeLabel.isHidden = false
        defLabel.isHidden = false
        heightLabel.isHidden = false
        pokeIdLabel.isHidden = false
        weightLabel.isHidden = false
        attackLabel.isHidden = false
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

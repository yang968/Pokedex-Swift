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
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var typeColorLabel: UILabel!
    @IBOutlet weak var defenseColorLabel: UILabel!
    @IBOutlet weak var heightColorLabel: UILabel!
    @IBOutlet weak var pokedexColorLabel: UILabel!
    @IBOutlet weak var weightColorLabel: UILabel!
    @IBOutlet weak var attackColorLabel: UILabel!
    
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
            self.updateVisuals()
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
        
        typeColorLabel.isHidden = true
        defenseColorLabel.isHidden = true
        heightColorLabel.isHidden = true
        pokedexColorLabel.isHidden = true
        weightColorLabel.isHidden = true
        attackColorLabel.isHidden = true
    }
    
    func showUI() {
        descLabel.isHidden = false
        typeLabel.isHidden = false
        defLabel.isHidden = false
        heightLabel.isHidden = false
        pokeIdLabel.isHidden = false
        weightLabel.isHidden = false
        attackLabel.isHidden = false
        
        typeColorLabel.isHidden = false
        defenseColorLabel.isHidden = false
        heightColorLabel.isHidden = false
        pokedexColorLabel.isHidden = false
        weightColorLabel.isHidden = false
        attackColorLabel.isHidden = false
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
    
    func updateVisuals() {
        print("update Pokemon Visuals")
        if let typeColor = typeColors[self.pokemon.mainType] {
            topView.backgroundColor = typeColor
            typeColorLabel.textColor = typeColor
            defenseColorLabel.textColor = typeColor
            heightColorLabel.textColor = typeColor
            pokedexColorLabel.textColor = typeColor
            weightColorLabel.textColor = typeColor
            attackColorLabel.textColor = typeColor
        }
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

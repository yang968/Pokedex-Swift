//
//  Constants.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/30/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import Foundation
import UIKit

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v2/pokemon/"
let URL_DESCRIPTION = "http://pokeapi.co/api/v2/pokemon-species/"

// Clousre when downloading information
typealias DownloadComplete = () -> ()

let typeColors : [String: UIColor] =
    [
    "Bug" : UIColor.init(red: 168/255, green: 184/255, blue: 32/255, alpha: 1),
    "Electric" : UIColor.init(red: 248/255, green: 208/255, blue: 48/255, alpha: 1),
    "Fire" : UIColor.init(red: 240/255, green: 128/255, blue: 48/255, alpha: 1),
    "Grass" : UIColor.init(red: 120/255, green: 200/255, blue: 80/255, alpha: 1),
    "Normal" : UIColor.init(red: 168/255, green: 168/255, blue: 120/255, alpha: 1),
    "Rock" : UIColor.init(red: 184/255, green: 160/255, blue: 56/255, alpha: 1),
    "Dark" : UIColor.init(red: 112/255, green: 88/255, blue: 72/255, alpha: 1),
    "Fairy" : UIColor.init(red: 222/255, green: 165/255, blue: 222/255, alpha: 1),
    "Flying" : UIColor.init(red: 168/255, green: 144/255, blue: 240/255, alpha: 1),
    "Ground" : UIColor.init(red: 224/255, green: 192/255, blue: 104/255, alpha: 1),
    "Poison" : UIColor.init(red: 160/255, green: 64/255, blue: 160/255, alpha: 1),
    "Steel" : UIColor.init(red: 184/255, green: 184/255, blue: 208/255, alpha: 1),
    "Dragon" : UIColor.init(red: 112/255, green: 56/255, blue: 248/255, alpha: 1),
    "Fighting" : UIColor.init(red: 192/255, green: 48/255, blue: 40/255, alpha: 1),
    "Ghost" : UIColor.init(red: 112/255, green: 88/255, blue: 152/255, alpha: 1),
    "Ice" : UIColor.init(red: 152/255, green: 216/255, blue: 216/255, alpha: 1),
    "Psychic" : UIColor.init(red: 248/255, green: 88/255, blue: 136/255, alpha: 1),
    "Water" : UIColor.init(red: 104/255, green: 144/255, blue: 240/255, alpha: 1)
    ]

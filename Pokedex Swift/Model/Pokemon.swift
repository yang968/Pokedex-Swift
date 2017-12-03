//
//  Pokemon.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/26/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    var name : String!
    var pokedexId : Int!
    var description : String!
    var type : String!
    var defense : String!
    var height : String!
    var weight : String!
    var attack : String!
    var nxtEvolution : String!
    var pokemonURL : String!
    var descURL : String!
    var evoChainURL : String!
    var statsUpdated = false
    var descUpdated = false
    
    let ATTACK_INDEX = 4
    let DEF_INDEX = 3
    
    init(name: String, pokedexId: Int) {
        self.name = name
        self.pokedexId = pokedexId
        
        self.pokemonURL = URL_BASE + URL_POKEMON + String(pokedexId) + "/"
        self.descURL = URL_DESCRIPTION + String(pokedexId) + "/"
        
    }
    /*
    func downloadPokemonInfo(completed: @escaping DownloadComplete) {
        Alamofire.request(pokemonURL).responseJSON { (response) in
            if response.result.isSuccess {
                let jsonData = JSON(response.result.value!)
                self.updateStats(json: jsonData)
                self.downloadDescription{}
            } else {
                self.type = ""
                self.defense = ""
                self.height = ""
                self.weight = ""
                self.attack = ""
                self.nxtEvolution = ""
            }
            completed()
        }
    }
    
    func downloadDescription(completed: @escaping DownloadComplete) {
        Alamofire.request(descURL).responseJSON { (response) in
            if response.result.isSuccess {
                let jsonData = JSON(response.result.value!)
                self.updateDescription(json: jsonData)
                //self.evoChainURL = jsonData["evolution_chain"]["url"].stringValue
                //print("evo: " + self.evoChainURL)
            } else {
                self.description = "Failed to receive data"
            }
            completed()
        }
    }
    */
    
    func downloadPokemonInfo(completed: @escaping DownloadComplete) {
        Alamofire.request(pokemonURL).responseJSON { (response) in
            if response.result.isSuccess {
                let jsonData = JSON(response.result.value!)
                self.updateStats(json: jsonData)
            } else {
                self.type = ""
                self.defense = ""
                self.height = ""
                self.weight = ""
                self.attack = ""
                self.nxtEvolution = ""
            }
            self.statsUpdated = true
            if self.statsUpdated && self.descUpdated {
                completed()
            }
        }
        
        Alamofire.request(descURL).responseJSON { (response) in
            if response.result.isSuccess {
                let jsonData = JSON(response.result.value!)
                self.updateDescription(json: jsonData)
            } else {
                self.description = "Failed to receive data"
            }
            self.descUpdated = true
            if self.statsUpdated && self.descUpdated {
                completed()
            }
        }
    }
    
    func updateDescription(json: JSON) {
        let descriptions = json["flavor_text_entries"]
        
        for desc in 0..<descriptions.count {
            if descriptions[desc]["language"]["name"].stringValue == "en" {
                description = descriptions[desc]["flavor_text"].stringValue.replacingOccurrences(of: "\n", with: " ")
                return
            }
        }
    }
    
    func updateStats(json: JSON) {
        //print(json)
        weight = json["weight"].stringValue
//        print(weight)
        height = json["height"].stringValue
        attack = json["stats"][ATTACK_INDEX]["base_stat"].stringValue
        //print(attack)
        defense = json["stats"][DEF_INDEX]["base_stat"].stringValue
        
        let types = json["types"]
        self.type = types[0]["type"]["name"].stringValue.capitalized
        for type in 1..<types.count {
            self.type.append("/" + types[type]["type"]["name"].stringValue.capitalized)
        }
        
    }
}

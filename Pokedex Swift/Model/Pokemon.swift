//
//  Pokemon.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/26/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import Foundation

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
    
    init(name: String, pokedexId: Int) {
        self.name = name
        self.pokedexId = pokedexId
    }
    
    
}

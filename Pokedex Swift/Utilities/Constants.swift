//
//  Constants.swift
//  Pokedex Swift
//
//  Created by Spencer Yang on 11/30/17.
//  Copyright © 2017 Seungho Yang. All rights reserved.
//

import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v2/pokemon/"
let URL_DESCRIPTION = "http://pokeapi.co/api/v2/pokemon-species/"

// Clousre when downloading information
typealias DownloadComplete = () -> ()

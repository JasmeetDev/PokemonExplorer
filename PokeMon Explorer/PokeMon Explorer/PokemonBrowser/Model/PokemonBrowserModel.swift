//  
//  PokemonBrowserModel.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import Foundation

struct PokemonBrowserModel: Decodable {
    var count : Int = 0
    var next: String  = ""
    var previous: String? = ""
    var results: [Results]?

}

struct Results: Decodable {
    var name: String = ""
    var url: String = ""
}

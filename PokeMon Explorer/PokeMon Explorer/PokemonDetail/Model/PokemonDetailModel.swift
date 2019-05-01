//  
//  PokemonDetailModel.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 01/05/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import Foundation

struct PokemonDetailModel: Codable {
    
    let abilities : [Abilities]?
    let baseExperience : Int?
    let forms : [Form]?
    let gameIndices : [GameIndice]?
    let height : Int?
    let heldItems : [String]?
    let id : Int?
    let isDefault : Bool?
    let locationAreaEncounters : String?
    let moves : [Form]?
    let name : String?
    let order : Int?
    let species : Form?
    let sprites : Sprite?
    let stats : [Form]?
    let types : [Types]?
    let weight : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case abilities = "abilities"
        case baseExperience = "base_experience"
        case forms = "forms"
        case gameIndices = "game_indices"
        case height = "height"
        case heldItems = "held_items"
        case id = "id"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves = "moves"
        case name = "name"
        case order = "order"
        case species
        case sprites
        case stats = "stats"
        case types = "types"
        case weight = "weight"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abilities = try values.decodeIfPresent([Abilities].self, forKey: .abilities)
        baseExperience = try values.decodeIfPresent(Int.self, forKey: .baseExperience)
        forms = try values.decodeIfPresent([Form].self, forKey: .forms)
        gameIndices = try values.decodeIfPresent([GameIndice].self, forKey: .gameIndices)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        heldItems = try values.decodeIfPresent([String].self, forKey: .heldItems)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isDefault = try values.decodeIfPresent(Bool.self, forKey: .isDefault)
        locationAreaEncounters = try values.decodeIfPresent(String.self, forKey: .locationAreaEncounters)
        moves = try values.decodeIfPresent([Form].self, forKey: .moves)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        species = try Form(from: decoder)
        sprites = try Sprite(from: decoder)
        stats = try values.decodeIfPresent([Form].self, forKey: .stats)
        types = try values.decodeIfPresent([Types].self, forKey: .types)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
    }
    
    
}

//  
//  PokemonBrowserServiceProtocol.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import Foundation

protocol PokemonBrowserServiceProtocol {

    func fetchPokemons(success: @escaping(_ data: PokemonBrowserModel) -> (), failure: @escaping(_ error: Error) -> ())
    func getPokemonDetail(_ id: Int, success: @escaping(_ data: PokemonDetailModel) -> (), failure: @escaping(_ error: Error) -> ())

}

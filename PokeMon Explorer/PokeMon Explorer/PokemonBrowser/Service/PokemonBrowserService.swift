//  
//  PokemonBrowserService.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireMapper

class PokemonBrowserService: PokemonBrowserServiceProtocol {
    // Call protocol function

    func fetchPokemons(success: @escaping(_ data: PokemonBrowserModel) -> (), failure: @escaping(_ error: Error) -> ()) {
        
        let url = URL(string: APIClient.baseURL+BaseMethod.pokemonSpecies)!
        Alamofire.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<PokemonBrowserModel>) in
                switch response.result {
                case let .success(data):
                    success(data)
                case let .failure(error):
                    failure(error)
                }
        }

    }

    func getPokemonDetail(_ id: Int, success: @escaping(_ data: PokemonDetailModel) -> (), failure: @escaping(_ error: Error) -> ()) {
        
        let url = URL(string: APIClient.baseURL+BaseMethod.pokemonDetail+"\(id)")!
        print(url)
        Alamofire.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<PokemonDetailModel>) in
                switch response.result {
                case let .success(data):
                    success(data)
                case let .failure(error):
                    failure(error)
                }
        }
        
    }
}

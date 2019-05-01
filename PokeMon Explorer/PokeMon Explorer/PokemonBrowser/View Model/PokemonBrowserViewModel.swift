//  
//  PokemonBrowserViewModel.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import Foundation

class PokemonBrowserViewModel {

    private let service: PokemonBrowserServiceProtocol

    var model: PokemonBrowserModel = PokemonBrowserModel() {
        didSet {
            self.count = self.model.results!.count
        }
    }
    
    var pokemonDetailModel: PokemonDetailModel?


    /// Count your data in model
    var count: Int = 0

    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model
    var selectedObject: PokemonBrowserModel?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?
    var didGetPokemonDetail: (( _ pokemonDetail: PokemonDetailModel?) -> ())?
    var didGetError: (() -> ())?

    
    init(withPokemonBrowser serviceProtocol: PokemonBrowserServiceProtocol = PokemonBrowserService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()

    }

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    //MARK: - Fetch pokemons
    func fetchPokemons() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            // call your service here
            self.service.fetchPokemons(success: { data in
                
                self.isLoading = false
                self.model = data
                self.didGetData?()
                
            }) { error  in
                print(error.localizedDescription)
                self.didGetError?()
            }
        default:
            break
        }
    }
    func getPokemonDetail(_ id: Int) {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            self.service.getPokemonDetail(id, success: { (detail) in
                self.pokemonDetailModel = detail
                self.didGetPokemonDetail?(detail)
            }) { (error) in
                print(error.localizedDescription)
                self.didGetError?()
            }
        default:
            break
        }
    }
}

extension PokemonBrowserViewModel {

}

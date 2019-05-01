//  
//  PokemonBrowserView.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import UIKit

class PokemonBrowserView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var browserTableView: UITableView!
    
    // VARIABLES HERE
    var viewModel = PokemonBrowserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        registerCell()
        setupViewModel()
        viewModel.fetchPokemons()
    }
    private func registerCell() {
        browserTableView.register(UINib(nibName: "BrowserTableCell", bundle: nil), forCellReuseIdentifier: "BrowserTableCell")
    }
    private func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.viewModel.didGetData = {
            // update UI after get data
            DispatchQueue.main.async {
                self.browserTableView.reloadData()
            }
        }
        
        self.viewModel.didGetPokemonDetail = { detail in
            DispatchQueue.main.async {
                self.showPokemonDetail(detail!)
            }
        }
        self.viewModel.didGetError = {
            DispatchQueue.main.async {
                self.showAlert("No record(s) found")
            }
        }
    }
    
    private func showAlert (_ message: String) {
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showPokemonDetail(_ detail: PokemonDetailModel) {
        let pokemonDetailView = self.storyboard?.instantiateViewController(withIdentifier: "PokemonDetailView") as! PokemonDetailView
        pokemonDetailView.pokemonDetailModel = detail
        pokemonDetailView.providesPresentationContextTransitionStyle = true
        pokemonDetailView.definesPresentationContext = true
        pokemonDetailView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        pokemonDetailView.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        DispatchQueue.main.async {
            self.present(pokemonDetailView, animated: false, completion: nil)
        }
    }
    
}


extension PokemonBrowserView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "BrowserTableCell", for: indexPath) as? BrowserTableCell else {
            fatalError()
        }
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        cell.viewModel = self.viewModel
        cell.updateView(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.getPokemonDetail(indexPath.row + 1)
    }
    
}

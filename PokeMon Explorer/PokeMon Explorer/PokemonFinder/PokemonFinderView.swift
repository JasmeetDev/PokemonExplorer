//
//  PokemonFinderView.swift
//  PokeMon Explorer
//
//  Created by Vaneet Modgill on 01/05/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import UIKit

class PokemonFinderView: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var inputField: UITextField!
    private var pokemonDetailView: PokemonDetailView!
    @IBOutlet weak var containerView: UIView!
    
    // VARIABLES HERE
    var viewModel = PokemonBrowserViewModel()
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    private func setUpView() {
        containerView.isHidden = true
        setupViewModel()
        goButton.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
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
        }
        
        self.viewModel.didGetPokemonDetail = { detail in
            DispatchQueue.main.async {
                self.showPokemonDetail(detail!)
            }
        }
        
        self.viewModel.didGetError = {
            DispatchQueue.main.async {
                self.showPokemonDetail(nil)
            }
        }
    }
    
    private func showPokemonDetail(_ detail: PokemonDetailModel?) {
        containerView.isHidden = false
        pokemonDetailView.pokemonDetailModel = detail
        pokemonDetailView.initialize()
        pokemonDetailView.closeButton.isHidden = true
        pokemonDetailView.view.bounds = self.containerView.bounds
        containerView.addSubview(self.pokemonDetailView.view)
    }
    //IBActions
    @IBAction func btnGoClicked(_ sender: Any) {
        self.viewModel.getPokemonDetail(Int(inputField.text!)!)
        self.view.endEditing(true)
    }
    
    @objc func textDidChange(_ notification: Notification) {
        goButton.isEnabled = true

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonDetailView,
            segue.identifier == "segueDetail" {
            self.pokemonDetailView = vc
        }
    }

}

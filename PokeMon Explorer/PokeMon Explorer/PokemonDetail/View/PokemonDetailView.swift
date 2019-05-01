//  
//  PokemonDetailView.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 01/05/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import UIKit

class PokemonDetailView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    // VARIABLES HERE
    var pokemonDetailModel: PokemonDetailModel?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()

    }
    
     func initialize() {
        if let pokemonDetailModel = self.pokemonDetailModel {
            pokemonNameLabel.text = pokemonDetailModel.name
            stackView.isHidden = false

            for i in 0 ... stackView.arrangedSubviews.count - 1 {
                if let label = stackView.arrangedSubviews[i] as? UILabel {
                    switch (i) {
                    case 0:
                        label.text = "Weight: \(pokemonDetailModel.weight ?? 0)"
                        break;
                    case 1:
                        label.text = "Base experience: \(pokemonDetailModel.baseExperience ?? 0)"
                        break;
                    case 2:
                        if let abilities = pokemonDetailModel.abilities?.map({$0.ability?.name}) as? [String] {
                            let stringRepresentation = abilities.joined(separator: ",")
                            label.text = "Abilities: \(stringRepresentation)"
                        }
                        break;
                    case 3:
                        if let abilities = pokemonDetailModel.types?.map({$0.type?.name}) as? [String] {
                            let stringRepresentation = abilities.joined(separator: ",")
                            label.text = "Types: \(stringRepresentation)"
                        }
                        
                        break;
                        
                    default:
                        break;
                    }
                }
            }
        }
        else {
            stackView.isHidden = true
            pokemonNameLabel.text = "No record(s) found"

        }

    }
    
    //IBActions
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}



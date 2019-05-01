//  
//  LandingPageView.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import UIKit

class LandingPageView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var landingTableView: UITableView!

    // VARIABLES HERE
    var contentData = ["Browse Pokemon", "Find a Pokemon"]

    //MARK - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView() {
        landingTableView.register(UINib(nibName: "LandingTableCell", bundle: nil), forCellReuseIdentifier: "LandingTableCell")
    }
}

extension LandingPageView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "LandingTableCell", for: indexPath) as? LandingTableCell else {
            fatalError()
        }
        cell.updateView(contentData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
          self.performSegue(withIdentifier: "seguePokemonBrowser", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "seguePokemonFinder", sender: nil)

        }
    }
}



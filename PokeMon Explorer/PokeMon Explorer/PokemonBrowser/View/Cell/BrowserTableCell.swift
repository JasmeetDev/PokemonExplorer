//
//  BrowserTableCell.swift
//  PokeMon Explorer
//
//  Created by Jasmeet Singh on 30/04/19.
//  Copyright © 2019 Jasmeet. All rights reserved.
//

import UIKit

class BrowserTableCell: UITableViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel = PokemonBrowserViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateView( _ index: Int) {
        indexLabel.text = "\(index + 1)"
        titleLabel.text = viewModel.model.results![index].name
    }
    
}

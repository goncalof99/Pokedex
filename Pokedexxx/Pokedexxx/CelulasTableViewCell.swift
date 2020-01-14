//
//  CelulasTableViewCell.swift
//  Pokedexxx
//
//  Created by Gonçalo Fialho on 02/07/2019.
//  Copyright © 2019 Gonçalo Fialho. All rights reserved.
//

import UIKit

class CelulasTableViewCell: UITableViewCell {

    @IBOutlet weak var img_pokemon: UIImageView!
    @IBOutlet weak var lbl_nomePokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

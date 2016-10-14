//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Morteza Araby on 2016-10-12.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
    }


}

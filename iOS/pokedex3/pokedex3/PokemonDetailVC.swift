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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImag: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokedexLbl.text = "\(pokemon.pokedexId)"
    
        
        pokemon.downloadPokemonDetail {
            // Whatever we write here only be called after the network call is complete!
            self.updateUI()
        }
    }
    
    func updateUI() -> Void {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolution"
            nextEvoImag.isHidden = true
        }else{
            nextEvoImag.isHidden = false
            nextEvoImag.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

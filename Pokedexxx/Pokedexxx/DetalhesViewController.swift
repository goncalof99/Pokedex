//
//  DetalhesViewController.swift
//  Pokedexxx
//
//  Created by Gonçalo Fialho on 02/07/2019.
//  Copyright © 2019 Gonçalo Fialho. All rights reserved.
//

import UIKit
func getPokemons(nome: String) -> Pokemon? {
    var aux:Pokemon?
    ListaPokemons.forEach { elem in
        if elem.Nome == nome {
            aux = elem
        }
    }
    return aux
}

class DetalhesViewController: UIViewController {

    
    @IBOutlet weak var lbl_SubTipo: UILabel!
    @IBOutlet weak var lbl_Forca: UILabel!
    @IBOutlet weak var lbl_Evolucoes: UILabel!
    @IBOutlet weak var lbl_Ataques: UILabel!
    @IBOutlet weak var lbl_Tipo: UILabel!
    @IBOutlet weak var lbl_Descricao: UILabel!
    @IBOutlet weak var lbl_HP: UILabel!
    @IBOutlet weak var lbl_XP: UILabel!
    @IBOutlet weak var lbl_nomePokemon: UILabel!
    @IBOutlet weak var img_pokemon: UIImageView!
    
    var imagem = UIImage()
    var nome = ""
    var descricao = ""
    var XP = 0
    var HP = 0
    var Tipo = ""
    var Ataques = ""
    var Evolucoes = ""
    var Forca = 0
    var SubTipo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_nomePokemon.text = "\(nome)"
        img_pokemon.image = imagem
        lbl_XP.text = "\(getPokemons(nome: nome)? .XP ?? 0)"
        lbl_HP.text = "\(getPokemons(nome: nome)? .HP ?? 0)"
        lbl_Descricao.text = "\(getPokemons(nome: nome)? .Descricao ?? "")"
        lbl_Tipo.text = "\(getPokemons(nome: nome)? .Tipo ?? "")"
        lbl_Ataques.text = "\(getPokemons(nome: nome)? .Ataques ?? "")"
        lbl_Evolucoes.text = "\(getPokemons(nome: nome)? .Evolucoes ?? "")"
        lbl_Forca.text = "\(getPokemons(nome: nome)? .Forca ?? 0)"
        lbl_SubTipo.text = "\(getPokemons(nome: nome)? .SubTipo ?? "")"
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}

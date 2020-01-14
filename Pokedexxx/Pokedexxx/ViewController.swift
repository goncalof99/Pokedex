//
//  ViewController.swift
//  Pokedexxx
//
//  Created by Gonçalo Fialho on 02/07/2019.
//  Copyright © 2019 Gonçalo Fialho. All rights reserved.
//

import UIKit


var ListaPokemons = [Pokemon]()


class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(btnAdd))
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableview.reloadData() 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getPokemons(nome: String) -> Pokemon? {
        var aux:Pokemon?
        ListaPokemons.forEach { elem in
            if elem.Nome == nome {
                aux = elem
            }
        }
        return aux
    }
    @objc func btnAdd(){
        guard let view = self.storyboard?.instantiateViewController(withIdentifier: "AdicionarPokemonViewController") as? AdicionarPokemonViewController else {
            return
        }
        
        self.navigationController?.pushViewController(view, animated: true)
    }

    }


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaPokemons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulas = tableView.dequeueReusableCell(withIdentifier: "celulas", for: indexPath) as? CelulasTableViewCell
        celulas?.lbl_nomePokemon.text = ListaPokemons[indexPath.row].Nome
        celulas?.img_pokemon.image = ListaPokemons[indexPath.row].Imagem
        return celulas!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetalhesViewController") as? DetalhesViewController
        vc?.imagem = ListaPokemons[indexPath.row].Imagem
        vc?.nome = ListaPokemons[indexPath.row].Nome
        vc?.Tipo = ListaPokemons[indexPath.row].Tipo
        vc?.Ataques = ListaPokemons[indexPath.row].Ataques
        vc?.Forca = ListaPokemons[indexPath.row].Forca
        vc?.SubTipo = ListaPokemons[indexPath.row].SubTipo
        vc?.XP = ListaPokemons[indexPath.row].XP
        vc?.HP = ListaPokemons[indexPath.row].HP
        vc?.Evolucoes = ListaPokemons[indexPath.row].Evolucoes
        vc?.descricao = ListaPokemons[indexPath.row].Descricao
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            ListaPokemons.remove(at: indexPath.row)
            tableView.reloadData()
            showToast(controller: self, message : "Pokemon Removida Da Lista", seconds: 2.0)
        }
    }
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.green
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 17
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
}



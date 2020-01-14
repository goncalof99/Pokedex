//
//  AdicionarPokemonViewController.swift
//  Pokedexxx
//
//  Created by Gonçalo Fialho on 02/07/2019.
//  Copyright © 2019 Gonçalo Fialho. All rights reserved.
//
import UIKit
var ImagemPokemon: UIImage?

class AdicionarPokemonViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    
    
    
    @IBOutlet weak var img_pokemon: UIImageView!
    @IBOutlet weak var txt_Nome: UITextField!
    @IBOutlet weak var txt_XP: UITextField!
    @IBOutlet weak var txt_HP: UITextField!
    @IBOutlet weak var txt_Descricao: UITextField!
    @IBOutlet weak var txt_Ataques: UITextField!
    @IBOutlet weak var txt_Tipo: UITextField!
    @IBOutlet weak var txt_SubTipo: UITextField!
    @IBOutlet weak var txt_Forca: UITextField!
    @IBOutlet weak var txt_Evolucoes: UITextField!
    
    var Nome: String?
    var Descricao: String?
    var Ataques: String?
    var Tipo: String?
    var SubTipo: String?
    var Evolucoes: String?
    
    @IBAction func btn_Guardar(_ sender: Any) {
        if(img_pokemon.image == nil){
            showToast(controller: self, message : "Por favor adicione uma Imagem", seconds: 2.0)
        }else {
            ImagemPokemon = img_pokemon.image
            Nome = txt_Nome.text
            let XP: Int = Int(txt_XP.text ?? "0") ?? 0
            let HP: Int = Int(txt_HP.text ?? "0") ?? 0
            Descricao = txt_Descricao.text
            Ataques = txt_Ataques.text
            Tipo = txt_Tipo.text
            SubTipo = txt_SubTipo.text
            let Forca: Int = Int(txt_Forca.text ?? "0") ?? 0
            Evolucoes = txt_Evolucoes.text
            ListaPokemons.append(Pokemon(nome: Nome!, xp: XP, hp: HP, descricao: Descricao!, ataques: Ataques!, tipo: Tipo!, subtipo: SubTipo!, forca: Forca, evolucoes: Evolucoes!, imagem: ImagemPokemon!))
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barra = UIToolbar()
        barra.sizeToFit()
        let espaco = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        barra.setItems([espaco, doneButton], animated: false)
        txt_Nome.inputAccessoryView = barra
        txt_XP.inputAccessoryView = barra
        txt_HP.inputAccessoryView = barra
        txt_Descricao.inputAccessoryView = barra
        txt_Ataques.inputAccessoryView = barra
        txt_Tipo.inputAccessoryView = barra
        txt_SubTipo.inputAccessoryView = barra
        txt_Forca.inputAccessoryView = barra
        txt_Evolucoes.inputAccessoryView = barra
        
   
    }
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
   
    @IBAction func btn_escolher(_ sender: Any) {
        let imagemController = UIImagePickerController()
        imagemController.delegate = self
        imagemController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagemController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        img_pokemon.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
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



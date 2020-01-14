//
//  Pokemon.swift
//  Pokedexxx
//
//  Created by Gonçalo Fialho on 02/07/2019.
//  Copyright © 2019 Gonçalo Fialho. All rights reserved.
//

import UIKit

class Pokemon {
    var Nome: String
    var XP: Int
    var HP: Int
    var Descricao: String
    var Ataques: String
    var Tipo: String
    var SubTipo: String
    var Forca: Int
    var Evolucoes: String
    var Imagem: UIImage
    
    init(nome: String, xp: Int, hp: Int, descricao: String, ataques: String, tipo: String, subtipo: String, forca: Int, evolucoes: String, imagem: UIImage) {
        self.Nome = nome
        self.XP = xp
        self.HP = hp
        self.Descricao = descricao
        self.Ataques = ataques
        self.Tipo = tipo
        self.SubTipo = subtipo
        self.Forca = forca
        self.Evolucoes = evolucoes
        self.Imagem = imagem
    }
}


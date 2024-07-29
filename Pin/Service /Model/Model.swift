//
//  Model.swift
//  Pin
//
//  Created by João Vitor Moreira on 03.07.24.
//

import Foundation

struct Funcionario: Codable, Identifiable {
    let id = UUID()
    var nome: String
    var tour: String
    var bicicleta: Bicicleta?
}

struct Bicicleta: Codable {
    var problemas: [Problema]
}

struct Problema: Codable, Identifiable {
    let id = UUID()
    var title: String
}

struct Pedido: Codable, Identifiable {
    let id = UUID()
    let problemas: [Problema]
}

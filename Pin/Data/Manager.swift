//
//  Manager.swift
//  Pin
//
//  Created by João Vitor Moreira on 11.07.24.
//

import Foundation


class Manager: ObservableObject {
    
    @Published var funcionario: Funcionario?
    
    init() {
        load()
    }

    static func saveUsuario(user: Usuario) {
        if let encodeData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodeData, forKey: "usuario")
        }
    }
    
   static func loadUsuario() -> Usuario? {
        if let savedData = UserDefaults.standard.data(forKey: "usuario"),
           let decodeData = try? JSONDecoder().decode(Usuario.self, from: savedData) {
           
            return decodeData
        }
        
        return nil
}
    
    
    func load() {
        if let savedData = UserDefaults.standard.data(forKey: "funcionario"),
           let decodeData = try? JSONDecoder().decode(Funcionario.self, from: savedData) {
            funcionario = decodeData
        }
    }
    
    func save() {
        if let encodeData = try? JSONEncoder().encode(funcionario) {
            UserDefaults.standard.set(encodeData, forKey: "funcionario")
        }
    }
    
    static func savePedido(pedidos: [Pedido]) {
        if let encodeData = try? JSONEncoder().encode(pedidos) {
            UserDefaults.standard.set(encodeData, forKey: "pedidos")
        }
    }
    
   static func loadPedidos() -> [Pedido] {
        if let savedData = UserDefaults.standard.data(forKey: "pedidos"),
           let decodeData = try? JSONDecoder().decode([Pedido].self, from: savedData) {
           
            return decodeData
        }
        
        return []
}
}

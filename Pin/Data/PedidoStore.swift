//
//  File.swift
//  Pin
//
//  Created by João Vitor Moreira on 05.04.26.
//

import Foundation

class PedidoStore: ObservableObject {
    
    @Published var pedidos: [Pedido] = [] {
      
        didSet {
            save()
        }
    }

    init() {
        load()
        UserDefaults.standard.removeObject(forKey: "pedidos")
    }

    func save() {
        let data = try? JSONEncoder().encode(pedidos)
        UserDefaults.standard.set(data, forKey: "pedidos")
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "pedidos") {
            pedidos = (try? JSONDecoder().decode([Pedido].self, from: data)) ?? []
        }
    }

    func delete(_ pedido: Pedido) {
        pedidos.removeAll { $0.id == pedido.id }
    }
    
    func addPedido(problemas: [Problema]) {
        let novoPedido = Pedido(problemas: problemas)
        pedidos.append(novoPedido)
    }
}

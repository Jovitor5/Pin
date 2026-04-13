//
//  ButtonViewModel.swift
//  Pin
//
//  Created by João Vitor Moreira on 10.04.26.
//

import Foundation


class ButtonViewModel: ObservableObject {
    
    func salvarPedidos(problemas: [Problema]) {
        let pedido = Pedido(problemas: problemas)
        
        var pedidosFeitos = Manager.loadPedidos()
        pedidosFeitos.append(pedido)
        
        Manager.savePedido(pedidos: pedidosFeitos)
    }
}

//
//  LoadPage.swift
//  Pin
//
//  Created by João Vitor Moreira on 23.07.24.
//

import SwiftUI

struct PedidosFeitosView: View {
    
    @State var pedidos: [Pedido] = []
    
    var body: some View {
        ScrollView {
            ForEach(pedidos) { pedido in
                CardPedidosView(pedido: pedido)
            }
        }
        .onAppear {
            pedidos = Manager.loadPedidos()
        }
    }
}
#Preview {
    PedidosFeitosView()
}

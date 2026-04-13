//
//  ListaDeProblemas.swift
//  Pin
//
//  Created by João Vitor Moreira on 01.12.25.
//

import Foundation
import SwiftUI

struct DetalhesPedidoView: View {
    var pedido: Pedido
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(pedido.problemas) { problema in
                    Text(problema.title)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)
                }
            }
            .padding()
        }
        .navigationTitle("Detalhes do Pedido")
        .navigationBarTitleDisplayMode(.inline)
    }
}

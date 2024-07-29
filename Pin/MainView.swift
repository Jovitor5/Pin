//
//  MainView.swift
//  Pin
//
//  Created by João Vitor Moreira on 18.07.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                
                FuncionarioView()
                
                List {
                    NavigationLink {
                        AddProblemasView()
                    } label: {
                        Text("Adicionar um pedido")
                        
                    }
                    .foregroundStyle(.blue)
                    
                    NavigationLink {
                        PedidosFeitosView()
                    } label: {
                        Text("Visualizar pedidos feitos")
                    }
                    .foregroundStyle(.blue)
                }
                Spacer()
            }
        }
    }
}
#Preview {
    MainView()
}

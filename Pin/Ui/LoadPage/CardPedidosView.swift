//
//  ViewDePedidos.swift
//  Pin
//
//  Created by João Vitor Moreira on 23.07.24.
//

import SwiftUI

struct CardPedidosView: View {
    
    let pedido: Pedido
    
    @State private var isExpanded = false
    
    var body: some View {
        if isExpanded {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }, label: {
                VStack {
                    ForEach(pedido.problemas) { problemas in
                        Text(problemas.title)
                            .foregroundStyle(.white)
                    }
                }
                .frame(minHeight: 100)
                .frame (maxWidth: .infinity, alignment: .center)
                .background(.black)
                .cornerRadius(10)
                .shadow(color: .red, radius: 5, x: 4, y: 4)
            })
            
        } else {
            VStack(alignment: .center) {
                Text(pedido.id.uuidString)
                    .font(.headline)
                Text("Problemas da bike")
                    .font(.subheadline)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Feito")
                        .foregroundStyle(.white)
                })
                .frame(width: 60, height: 10)
                .padding()
                .background("#008000".fromHex())
                .cornerRadius(20)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
}
#Preview {
    CardPedidosView(pedido: Pedido(problemas: []))
}


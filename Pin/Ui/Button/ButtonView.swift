//
//  ButtonView.swift
//  Pin
//
//  Created by João Vitor Moreira on 28.07.24.
//

import SwiftUI

struct ButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var problemasDaMinhaBicicleta: [Problema]
    
    @State private var showAlert = false
    
    @ObservedObject var viewModel = ButtonViewModel()
    
    var body: some View {
        Button {
            viewModel.salvarPedidos(problemas: problemasDaMinhaBicicleta)
            showAlert = true
            presentationMode.wrappedValue.dismiss()
        }
    label: {
        Text("Enviar Relatorio")
            .foregroundStyle(.white)
            .bold()
    }
    .padding(10)
    .background(problemasDaMinhaBicicleta.isEmpty ? .gray : "#008000".fromHex())
    .cornerRadius(8)
    .padding()
    .disabled(problemasDaMinhaBicicleta.isEmpty ? true : false)
    .padding(.bottom, 8)
    .alert(isPresented: $showAlert) {
        Alert(
            title: Text("Parabéns!!"),
            message: Text("O seu pedido foi confirmado."),
            dismissButton: .default(Text("Voltar"))
        )
    }
  }
}

#Preview {
    ButtonView(problemasDaMinhaBicicleta: .constant([]))
}

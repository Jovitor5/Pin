//
//  Problemas Lista.swift
//  Pin
//
//  Created by João Vitor Moreira on 03.07.24.
//

import SwiftUI

struct ProblemasLista: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var problemasDaMinhaBicicleta: [Problema]
    
    @State private var mostrarAlerta = false
    
    @ObservedObject var viewModel = ViewModel()
    
    @State private var textoDePesquisa = ""
    
    var body: some View {
        List {
            Section {                               // sao todos os meu problemas do json
                ForEach(viewModel.filterProblems) { problema in
                    Button(action: {
                        
                        if problemasDaMinhaBicicleta.contains(where: { $0.title == problema.title }) {
                            
                            mostrarAlerta = true
                            
                        } else {
                            problemasDaMinhaBicicleta.append(problema)
                            
                            problemasDaMinhaBicicleta.sort(by: { $0.title < $1.title })
                            
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                        , label: {
                        Text(problema.title)
                            .foregroundStyle(.black)
                    })
                }
            }
            .alert(isPresented: $mostrarAlerta) {
                Alert(title: Text("Erro!"), message: Text("Problema já adicionado."), dismissButton: .default(Text("Cancelar")))
            }
        }
        
        .searchable(text: $viewModel.search)
        
        .onAppear {
            viewModel.fetchProblems()
        }
    }
}
#Preview {
    ProblemasLista(problemasDaMinhaBicicleta: .constant([]))
}

//
//  ProblemasView.swift
//  Pin
//
//  Created by João Vitor Moreira on 03.07.24.
//

import SwiftUI
struct AddProblemasView: View {
    
    @State var problemasDaMinhaBicicleta: [Problema] = []
    
    var body: some View {
        VStack {
            List {
                Section {
                    NavigationLink("Adicionar novo problema") {
                        ProblemasLista(problemasDaMinhaBicicleta: $problemasDaMinhaBicicleta)
                    }
                    .foregroundColor(.blue)
                }
                Section {
                    ForEach(problemasDaMinhaBicicleta) { problema in
                        Text(problema.title)
                    }
                    .onDelete(perform: { indexSet in
                        problemasDaMinhaBicicleta.remove(atOffsets: indexSet)
                    })
                }
            }
            ButtonView(problemasDaMinhaBicicleta: $problemasDaMinhaBicicleta)
        }
    }
}
#Preview {
    AddProblemasView()
}


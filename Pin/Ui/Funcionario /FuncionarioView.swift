//
//  FuncionarioView.swift
//  Pin
//
//  Created by João Vitor Moreira on 09.07.24.
//

import SwiftUI

struct FuncionarioView: View {
    
    @State var user: Usuario?
    
    var body: some View {
        HStack {
            Image("foto")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Nome: \(user?.name ?? "")")
                Text("Tour: \(user?.senha ?? "")")
            }
            .font(.system(size: 20))
            .foregroundColor("#FFFFFF".fromHex())
            .bold()
            
            Spacer()
        }
        .frame(height: 100)
        .onAppear {
            user = Manager.loadUsuario()
        }
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.black),
            alignment: .bottom
        )
        .background("#008000".fromHex())
    }
}

#Preview {
    FuncionarioView()
}

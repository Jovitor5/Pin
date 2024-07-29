//
//  Cadastro .swift
//  Pin
//
//  Created by João Vitor Moreira on 16.07.24.
//

import SwiftUI

struct CadastroView: View {
    
    @State var name: String = ""
    
    @State var senha: String = ""
    
    
    var body: some View {
        VStack {
            TextField("Nome", text: $name)
                .disableAutocorrection(true)
                .padding(5)
                .border(.black)
                .cornerRadius(5)
                .padding()
            
            TextField("Senha", text: $senha)
                .disableAutocorrection(true)
                .padding(5)
                .border(.black)
                .cornerRadius(5)
                .padding()
            
            Button(action: {
                Manager.saveUsuario(user: Usuario(name: name, senha: senha))
            }, label: {
                Text("Entrar")
            })
        }
    }
}

#Preview {
    CadastroView()
}

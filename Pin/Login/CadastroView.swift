//
//  CadastroView.swift
//  Pin
//
//  Created by João Vitor Moreira on 15.08.24.
//

import SwiftUI

struct CadastroView: View {
    
    @ObservedObject var viewModel = CadastroViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Registration")
            Text("please register down below")
            
            VStack (spacing: 20) {
                HStack() {
                    TextField("first name", text: $viewModel.name)
                        .padding()
                        .border(.black)
                    
                    TextField("Last Name", text: $viewModel.lastName)
                        .padding()
                        .border(.black)
                }
                
                TextField("email", text: $viewModel.email)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(.black)
                
                TextField("UserName", text: $viewModel.userName)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(.black)
                
                TextField("Password", text:$viewModel.password)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(.black)
                
                HStack {
                    TextField("City", text: $viewModel.city)
                        .padding()
                        .border(.black)
                    
                    TextField("Street", text: $viewModel.street)
                        .padding()
                        .border(.black)
                }
                
                HStack {
                    TextField("Number", text: $viewModel.number)
                        .padding()
                        .border(.black)
                    
                    
                    VStack {
                        TextField("Zipcode", text: $viewModel.zipCode)
                            .keyboardType(.numberPad)
                            .padding()
                            .border(.black)
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.top, -2)
                                .font(.system(size: 10))
                        }
                    }
                }
                
                TextField("Phone", text: $viewModel.phone)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .border(.black)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Register")
                    
                })
                .buttonStyle(.borderedProminent)
            }
            .padding(.top)
        }
        .padding(5)
    }
}

#Preview {
    CadastroView()
}

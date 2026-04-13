//
//  CadastroViewModel.swift
//  Pin
//
//  Created by João Vitor Moreira on 15.08.24.
//

import Foundation


class CadastroViewModel: ObservableObject {
    @Published var name = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var userName = ""
    @Published var password = ""
    @Published var city = ""
    @Published var street = ""
    @Published var number = ""
    @Published var zipCode = "" {
        didSet {
            validateInput()
        }
    }
    
    @Published var phone = ""
    @Published var showAlert: Bool = false
    @Published var errorMessage: String? = nil
    
   private func validateInput() {
        let filtered = zipCode.filter { "0123456789".contains($0) }
        
        if filtered != zipCode {
            zipCode = filtered
            showAlert = true
            errorMessage = "Apenas números são permitidos."
        } else {
            errorMessage = nil
        }
    }
}

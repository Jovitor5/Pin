//
//  String+Extension.swift
//  Pin
//
//  Created by João Vitor Moreira on 08.08.24.
//

import Foundation

extension String {
    var emailIsValid: Bool {
        return self.contains("@")
    }
}

extension String {
    func validatePhoneNumber() -> Bool {
        // Remove espaços em branco e caracteres não numéricos
        let cleanedNumber = self.filter { "0123456789".contains($0) }
        
        // Verifica se o número tem exatamente 11 dígitos e começa com "9"
        if cleanedNumber.count == 11 && cleanedNumber.hasPrefix("9") {
            return true
        } else {
            return false
        }
    }
}



//
//  AppError.swift
//  Pin
//
//  Created by João Vitor Moreira on 06.08.24.
//

import Foundation

class AppError: Error {
    let mensage: String
    
    init(mensage: String) {
        self.mensage = mensage
    }
}



//
//  AutenticationError.swift
//  Pin
//
//  Created by João Vitor Moreira on 06.08.24.
//

import Foundation

//enum LoginError: Error {
//    case invalidInput, loginFailed, invalidEmail, wrongPassword, UserNotFound, ErrorDesconhecido
//}

class InvalidInputError: AppError {
    init() {
        super.init(mensage: "Input Invalido")
    }
}

class InvalidEmail: AppError {
    init() {
        super.init(mensage: "Email Invalido")
    }
}

class loginFailed: AppError {
    init() {
        super.init(mensage: "Login Invalido")
    }
}

class InvalidZipCode: AppError {
    init() {
        super.init(mensage: "Cep Invalido")
    }
}

class InvalidNumber: AppError {
    init() {
        super.init(mensage: "Numero Invalido")
    }
}


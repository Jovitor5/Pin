//
//  LoginUseCase.swift
//  Pin
//
//  Created by João Vitor Moreira on 02.08.24.
//

import Foundation

struct LoginUseCase {
    
    private let userService: UserService
        
    init(userService: UserService) {
        self.userService = userService
    }
    
    // async (funcao que precisa ser finalizada antes de fazer outra coisa)
    func execute(email: String, password: String) async throws -> User {
        if email.isEmpty || password.isEmpty {
            throw InvalidInputError()
        }
        
        if !email.emailIsValid {
            throw InvalidEmail()
        }
        
        return try await userService.login(email: email, password: password)
    }
}


struct RegisterUseCase {
    private let userRepository: UserService
    
    init(userRepository: UserService = FirebaseUserService()) {
        self.userRepository = userRepository
    }
    
    // async (funcao que precisa ser finalizada antes de fazer outra coisa)
    func execute(parameter: Cadastro) async throws -> User {
        if !parameter.email.emailIsValid {
            throw InvalidEmail()
        }
        
        if parameter.zipCode.count != 8 {
            throw InvalidZipCode()
        }
        
        if parameter.phone.validatePhoneNumber() == false {
            throw InvalidNumber()
        }
        return try await userRepository.register(parameters: parameter)
    }
}

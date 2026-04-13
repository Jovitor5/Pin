//
//  UserRepositoryProtocol.swift
//  Pin
//
//  Created by João Vitor Moreira on 02.08.24.
//

import Foundation

protocol UserService {
    func login(email: String, password: String) async throws -> User
    
    func register(parameters: Cadastro) async throws -> User
}

protocol UserService2 {
    func login (telefone: String)
}



//
//  FirebaseUserRepository.swift
//  Pin
//
//  Created by João Vitor Moreira on 02.08.24.
//

import Foundation
import Firebase
import FirebaseAuth

enum LoginError: Error {
    case invalidInput, loginFailed, invalidEmail, wrongPassword, UserNotFound, ErrorDesconhecido
}

class FirebaseUserService: UserService {
    func register(parameters: Cadastro) async throws -> User {
        return User(userID: "", email: "")
    }
    // throws: possibilita lancar um erro ou uma excessao na funca do tipo Error.
    func login(email: String, password: String) async throws -> User {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            guard let email = result.user.email else {
                throw LoginError.loginFailed
            }
            
            return User(userID: result.user.uid, email: email)
            
        } catch let error as NSError {
            throw error
        }
    }
}


class HotmailRepositore: UserService2 {
    func login(telefone: String) {
        
    }
}
class FakeRepositore: UserService {
    func login(email: String, password: String) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    func register(parameters: Cadastro) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    
}
 
class AppleRepositore: UserService {
    func login(email: String, password: String) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    func register(parameters: Cadastro) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
     
}

class GoogleRepositore: UserService {
    func login(email: String, password: String) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    func register(parameters: Cadastro) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    
}

class FacebookRepositore: UserService {
    func login(email: String, password: String) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    func register(parameters: Cadastro) async throws -> User {
        return User(userID: "oi", email: "hallo")
    }
    
    
}

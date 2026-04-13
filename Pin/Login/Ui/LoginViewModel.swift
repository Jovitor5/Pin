//
//  LoginViewModel.swift
//  Pin
//
//  Created by João Vitor Moreira on 02.08.24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var errorMensager = ""
    
    @Published var isLoading = false
    
    @Published var email: String = ""
    
    @Published var senha: String = ""
    
    // minha classe inicializa a partir desse init
    
    private func login(service: UserService) {
        isLoading = true
        errorMensager = ""
        
        // usamos task pq minha funcao esta usando async
        Task {
            do {
                let loginUserCase = LoginUseCase(userService: service)
                
                let user = try await loginUserCase.execute(email: email, password: senha)
                
                //DispatchQueue.main.async ele faz com que a view seja atualizada primeiro enquanto usamor await, async e task
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("usuario logado \(user.email)")
                }
            } catch let error as AppError {
                self.errorMensager = error.mensage
            } catch let error as NSError {
                self.isLoading = false
                
                if let authErrorCode = AuthErrorCode(rawValue: error.code) {
                    switch authErrorCode {
                    case .invalidEmail:
                        self.errorMensager = "Email Inválido"
                    case .wrongPassword:
                        self.errorMensager = "Senha Inválida"
                    case .invalidCredential:
                        self.errorMensager = "A credencial de autenticação fornecida está malformada ou expirou."
                    case .userNotFound:
                        self.errorMensager = "Usuario nao encontrado"
                    default:
                        self.errorMensager = "Erro desconhecido"
                    }
                } else {
                    self.errorMensager = "Erro desconhecido"
                }
            }
        }
    }
    
    //  Minha funcao login está usando LoginUseCase pois inicializei ali em cima
    func LoginFacebook() {
        login(service: FacebookRepositore())
    }
    
    func LoginApple() {
        login(service: AppleRepositore())
    }
    
    func LoginfireBase() {
        login(service: FirebaseUserService())
    }
    
}

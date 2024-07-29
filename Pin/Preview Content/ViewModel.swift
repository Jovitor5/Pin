//
//  ViewModel.swift
//  Pin
//
//  Created by João Vitor Moreira on 03.07.24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var search: String = ""
    
    @Published var problemas: [Problema] = []
    
    @Published var funcionario: Funcionario?
    
    func fetchCategorias() {
        
        if let path = Bundle.main.path (forResource: "dados", ofType: "json") {
            
            do {
                let jsonData = try Data (contentsOf: URL(fileURLWithPath: path))
                
                let funcionario = try JSONDecoder().decode(Funcionario.self, from: jsonData)
                
                self.funcionario = funcionario
                
            } catch {
                print (error.localizedDescription)
            }
            
        } else {
            print("Arquivo Json não encontrado.")
        }
    }
    
    func fetchProblems() {
        if let path = Bundle.main.path (forResource: "problemas", ofType: "json") {
            
            do {
                let jsonData = try Data (contentsOf: URL(fileURLWithPath: path))
                
                let problema = try JSONDecoder().decode([Problema].self, from: jsonData)
                
                self.problemas = problema
                
            } catch {
                print (error.localizedDescription)
            }
            
        } else {
            print("Arquivo Json não encontrado.")
        }
    }
                            // ab
    var filterProblems: [Problema] {
        if search.isEmpty {
            return problemas.sorted(by: { problem1, problem2 in
                problem1.title < problem2.title
            })
        }
        return problemas.filter {
            $0.title.localizedStandardContains(search)
        }.sorted(by: { problem1, problem2 in
            problem1.title < problem2.title
            
        })
    }
}

//
//  SpellsViewModel.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import Foundation

@MainActor
class SpellsViewModel : ObservableObject{
    
    @Published var spellsList : [Spell] = []
    
    init() {
        self.loadSpells()
    }
    
    func loadSpells(){
        Task{
            do{
                self.spellsList = try await self.fetchSpells()
            }catch{
                print(error)
            }
        }
    }
    
    func fetchSpells() async throws -> [Spell]{
        try await withCheckedThrowingContinuation{(continuation:
        CheckedContinuation<[Spell],Error>) in
            let endpoint = "https://hp-api.onrender.com/api/spells"
            guard let url = URL(string: endpoint)else{
                return
            }
            
            let task = URLSession.shared.dataTask(with: url){
                data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                
                do{
                    let decoder = try JSONDecoder().decode([Spell].self, from: data)
                    continuation.resume(returning: decoder)
                }catch{
                    continuation.resume(throwing: error)
                }
                
            }
            task.resume()
            
        }
    }
    
}

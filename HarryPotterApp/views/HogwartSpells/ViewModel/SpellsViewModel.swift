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
    @Published var isLoadingList: Bool = false
    
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
            self.isLoadingList = true
            let endpoint = "https://hp-api.onrender.com/api/spells"
            guard let url = URL(string: endpoint)else{
                self.isLoadingList = false
                return
            }
            
            let task = URLSession.shared.dataTask(with: url){
                data, _, error in
                guard let data = data, error == nil else{
                    DispatchQueue.main.async {
                        self.isLoadingList = false
                    }
                    return
                }
                
                do{
                    let decoder = try JSONDecoder().decode([Spell].self, from: data)
                    continuation.resume(returning: decoder)
                    DispatchQueue.main.async {
                        self.isLoadingList = false
                    }
                }catch{
                    continuation.resume(throwing: error)
                    DispatchQueue.main.async {
                        self.isLoadingList = false
                    }
                }
                
            }
            task.resume()
            
        }
    }
    
}

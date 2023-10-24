//
//  CharacterViewModel.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject{
    
    
    @Published var character: Character?
    @Published var isLoadingCharacter: Bool = false
    
    init(characterId: String){
        fetchData(characterId: characterId)
    }
    
    /*func loadCharacter(characterId: String){
        Task{
            do{
                self.character = try self.fetchData(characterId: characterId)
            }catch{
                print(error)
            }
        }
    }*/
    
//    func fetchCharacterData(characterId: String) async throws -> Character{
//        try await withCheckedThrowingContinuation{(continuation:
//        CheckedContinuation<Character,Error>) in
//            let endpoint = "https://hp-api.onrender.com/api/character/\(characterId)"
//            print(endpoint)
//            guard let url = URL(string: endpoint)else{
//                return
//            }
//
//            let task = URLSession.shared.dataTask(with: url){
//                data, _, error in
//                guard let data = data, error == nil else{
//                    return
//                }
//
//                do{
//                    let decoder = try JSONDecoder().decode(Character.self, from: data)
//                    continuation.resume(returning: decoder)
//                }catch{
//                    continuation.resume(throwing: error)
//                }
//
//            }
//            task.resume()
//
//        }
//    }
    
    func fetchData(characterId: String){
        
        self.isLoadingCharacter = true
        let endpoint = "https://hp-api.onrender.com/api/character/\(characterId)"
        
        print("ENDPOINT: ")
        print(endpoint)
        
        guard let url = URL(string: "https://hp-api.onrender.com/api/character/\(characterId)") else {
                    print("Invalid URL")
                    return
                }
                let request = URLRequest(url: url)

                URLSession.shared.dataTask(with: request) {data, response, error in
                    
                    if let error = error {
                        print("Fetch failed: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            self.isLoadingCharacter = false
                        }
                        return
                    }
                    
                    if let data = data {
                        
                        do {
                            let responseD = try JSONDecoder().decode([Character].self, from: data)
                            DispatchQueue.main.async {
                                self.character = responseD.first
                                self.isLoadingCharacter = false
                            }
                            print(responseD)
                            return
                        } catch  {
                            print("\(error.localizedDescription)")
                            DispatchQueue.main.async {
                                self.isLoadingCharacter = false
                            }
                            return
                        }
                    }
                }.resume()
        
        
    }
    
}

enum HPErrors: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

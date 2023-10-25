//
//  CharactersByHouseViewModel.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 24/10/23.
//

import Foundation

@MainActor
class CharactersByHouseViewModel: ObservableObject{
    
    @Published var charactersHouse: [Character] = []
    @Published var isLoadingList: Bool = false
    
    init(house: String){
        fetchData(house: house)
    }
    
    func fetchData(house:String){
        self.isLoadingList = true
        let endpoint = "https://hp-api.onrender.com/api/characters/house/\(house)"
        
        print("ENDPOINT: ")
        print(endpoint)
        
        guard let url = URL(string: endpoint) else {
                    print("Invalid URL")
                    return
                }
                let request = URLRequest(url: url)

                URLSession.shared.dataTask(with: request) {data, response, error in
                    
                    if let error = error {
                        print("Fetch failed: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            self.isLoadingList = false
                        }
                        return
                    }
                    
                    if let data = data {
                        
                        do {
                            let responseD = try JSONDecoder().decode([Character].self, from: data)
                            DispatchQueue.main.async {
                                self.charactersHouse = responseD
                                self.isLoadingList = false
                            }
                            print(responseD)
                            return
                        } catch  {
                            print("\(error.localizedDescription)")
                            DispatchQueue.main.async {
                                self.isLoadingList = false
                            }
                            return
                        }
                    }
                }.resume()
    }
    
}

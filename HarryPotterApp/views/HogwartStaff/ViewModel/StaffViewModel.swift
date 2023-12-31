//
//  StaffViewModel.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import Foundation

@MainActor
class StaffViewModel: ObservableObject{
    
    @Published var staffList : [Character] = []
    @Published var isLoading = false
    
    init(){
        self.loadStaff()
    }
    
    func loadStaff(){
        Task{
            do{
                self.staffList = try await fecthStaff()
            }catch{
                print(error)
            }
        }
    }
    
    
    func fecthStaff() async throws -> [Character]{
        
        try await withCheckedThrowingContinuation{
            (continuation: CheckedContinuation<[Character],Error>) in
            self.isLoading = true
            let endpoint = "https://hp-api.onrender.com/api/characters/staff"
            
            guard let url = URL(string: endpoint)else{
                self.isLoading = false
                 return
            }
            
            let task = URLSession.shared.dataTask(with: url){
                data, _, error in
                guard let data = data, error == nil else{
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                    return
                }
                
                do{
                    let decoder = try JSONDecoder().decode([Character].self, from: data)
                    continuation.resume(returning: decoder)
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }catch{
                    continuation
                        .resume(throwing: error)
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            }
            task.resume()
        }
        
    }
    
}

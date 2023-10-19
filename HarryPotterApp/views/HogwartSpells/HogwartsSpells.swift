//
//  HogwartsSpells.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI
import UIKit

struct HogwartsSpells: View {
    
    @StateObject var spellsViewModel = SpellsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            Text("Spells")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            NavigationStack{
                
                ScrollView{
                    VStack(spacing: 20){
                        ForEach(searchResults, id: \.id){
                            spell in
                            SpellsCard(spell: spell)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .background(
                    Color("appBackground")
                )
            }
            .searchable(text: $searchText,prompt: "Search a spell...")
            .onAppear{
                let appereance = UISearchBar.appearance()
                appereance.backgroundColor = .clear
                appereance.tintColor = UIColor.white
                appereance.barTintColor = UIColor.clear
                
                UISearchTextField.appearance().backgroundColor = .white
                
                
                let navigationBarAppearance = UINavigationBarAppearance()
                navigationBarAppearance.configureWithOpaqueBackground()
                navigationBarAppearance.titleTextAttributes = [
                    NSAttributedString.Key.foregroundColor : UIColor.white
                ]
                navigationBarAppearance.backgroundColor = UIColor.clear
                navigationBarAppearance.shadowColor = nil
                
                let navigationBar = UINavigationBar.appearance()
                navigationBar.standardAppearance = navigationBarAppearance
                navigationBar.compactAppearance = navigationBarAppearance
                navigationBar.scrollEdgeAppearance = navigationBarAppearance
                
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                tabBarAppearance.backgroundColor = UIColor.clear
                
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                UITabBar.appearance().standardAppearance = tabBarAppearance
            }
        }
        .background(
            Color("appBackground")
        )
    }
    
    var searchResults: [Spell] {
        if searchText.isEmpty {
            return spellsViewModel.spellsList
        } else {
            return spellsViewModel.spellsList.filter { $0.name!.contains(searchText)}
        }
    }
    
}

struct HogwartsSpells_Previews: PreviewProvider {
    static var previews: some View {
        HogwartsSpells()
    }
}

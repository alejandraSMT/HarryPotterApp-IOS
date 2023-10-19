//
//  ContentView.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HogwartsHouses()
                .tabItem{
                    Label("Houses",systemImage: "house.fill")
                }
                
            HouseStaff()
                .tabItem{
                    Label("Staff",systemImage: "person.3.fill")
                }
            HogwartsSpells()
                .tabItem{
                    Label("Spells",systemImage: "wand.and.stars.inverse")
                }
        }
        .tint(Color("selectedTab"))
        .onAppear{
            
            let appereance = UITabBar.appearance()
            appereance.barTintColor = UIColor(Color("tabBar"))
            appereance.backgroundColor = UIColor(Color("tabBar"))
            appereance.isTranslucent = true
            appereance.unselectedItemTintColor = .lightGray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

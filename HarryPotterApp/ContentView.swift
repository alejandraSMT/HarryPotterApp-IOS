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
        .tint(.white)
        .onAppear{
            
            let appereance = UITabBar.appearance()
            appereance.barTintColor = UIColor(Color("topBarBackground"))
            appereance.backgroundColor = UIColor(Color("topBarBackground"))
            appereance.isTranslucent = true
            appereance.unselectedItemTintColor = .gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

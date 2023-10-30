//
//  CharactersByHouse.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 24/10/23.
//

import SwiftUI

struct CharactersByHouse: View {
    
    var house: String
    var firstColor: String
    var secondColor: String
    var darkerColor: String
    // binding path from previous view
    @Binding var path : NavigationPath
    
    @StateObject var CBHViewModel: CharactersByHouseViewModel
    
    init(house: String, firstColor: String, secondColor: String, darkerColor: String, path: Binding<NavigationPath>){
        self.house = house
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.darkerColor = darkerColor
        self._path = path
        self._CBHViewModel = StateObject(wrappedValue: CharactersByHouseViewModel(house: house))
    }
    
    var body: some View {
        
        
        let girlsList = CBHViewModel.charactersHouse.filter({$0.gender == "female" && $0.hogwartsStudent == true})
        let boysList = CBHViewModel.charactersHouse.filter({$0.gender == "male" && $0.hogwartsStudent == true})
        
        
            Group{
                if(!CBHViewModel.isLoadingList){
                    VStack(alignment: .leading, spacing:3){
                            
                            LinearGradient(colors: [Color(darkerColor),Color(darkerColor)], startPoint: .top, endPoint: .bottom)
                                .foregroundColor(.clear)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .overlay(
                                    Text(house.capitalized)
                                        .padding(.top,40)
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .bold()
                                )
                                .ignoresSafeArea(edges: [.top, .bottom])
                                
                                ScrollView{
                                    VStack(alignment: .leading){
                                        //girls dorm
                                        Group{
                                            Text("Girls Dorm")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .padding(5)
                                            ScrollView(.horizontal, showsIndicators: false){
                                                HStack(spacing: 20){
                                                    ForEach(girlsList, id:\.id){
                                                        character in
                                                        CardCharacterByHouse(character: character)
                                                            .onTapGesture{
                                                                path.append(HousesDestinations
                                                                    .characterProfile(id: character.id)
                                                                )
                                                            }
                                                    }
                                                }
                                            }
                                            .padding(10)
                                        }
                                        
                                        //boys dorm
                                        Group{
                                            Text("Boys Dorm")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .padding(5)
                                            ScrollView(.horizontal){
                                                HStack(spacing: 20){
                                                    ForEach(boysList, id:\.id){
                                                        character in
                                                        CardCharacterByHouse(character: character)
                                                            .onTapGesture{
                                                                path.append(HousesDestinations
                                                                    .characterProfile(id: character.id)
                                                                )
                                                            }
                                                    }
                                                }
                                            }
                                            .padding(10)
                                        }
                                    }
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .edgesIgnoringSafeArea([.top, .trailing, .leading])
                        }
                }else{
                    ProgressView()
                        .tint(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color("appBackground"))
            .edgesIgnoringSafeArea([.top, .trailing, .leading])
    }
}

struct CharactersByHouse_Previews: PreviewProvider {
    static var previews: some View {
        CharactersByHouse(house: "gryffindor", firstColor: "gryffindorFirst", secondColor: "gryffindorSecond", darkerColor: "gryffindorDarker", path: .constant(NavigationPath()))
    }
}

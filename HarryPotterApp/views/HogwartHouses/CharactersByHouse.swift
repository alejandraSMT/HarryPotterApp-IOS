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
    
    @StateObject var CBHViewModel: CharactersByHouseViewModel
    
    init(house: String, firstColor: String, secondColor: String){
        self.house = house
        self.firstColor = firstColor
        self.secondColor = secondColor
        self._CBHViewModel = StateObject(wrappedValue: CharactersByHouseViewModel(house: house))
    }
    
    var body: some View {
        
        let girlsList = CBHViewModel.charactersHouse.filter({$0.gender == "female" && $0.hogwartsStudent == true})
        let boysList = CBHViewModel.charactersHouse.filter({$0.gender == "male" && $0.hogwartsStudent == true})
        
        Group{
            if(!CBHViewModel.isLoadingList){
                VStack(alignment: .leading, spacing:3){
                        
                        LinearGradient(colors: [Color(firstColor),Color(secondColor)], startPoint: .top, endPoint: .bottom)
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .overlay(
                                Text(house.capitalized)
                                    .padding(.top,40)
                                    .font(.title)
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
                                                    VStack{
                                                        AsyncImage(url: URL(string:character.image ?? "")){
                                                            image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 200, height: 220)
                                                                .cornerRadius(20)

                                                        } placeholder: {
                                                            Rectangle()
                                                                .frame(width: 200, height: 220)
                                                                .cornerRadius(20)
                                                                .overlay(
                                                                    Image(uiImage: UIImage(named: "houses_icon")!)
                                                                        .resizable()
                                                                        .frame(width:50, height:60)
                                                                        .foregroundColor(.white)
                                                                )
                                                        }
                                                        Text(character.name ?? "")
                                                            .foregroundColor(.white)
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
                                                    VStack{
                                                        AsyncImage(url: URL(string:character.image ?? "")){
                                                            image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 200, height: 220)
                                                                .cornerRadius(20)

                                                        } placeholder: {
                                                            Rectangle()
                                                                .frame(width: 200, height: 220)
                                                                .cornerRadius(20)
                                                                .overlay(
                                                                    Image(uiImage: UIImage(named: "houses_icon")!)
                                                                        .resizable()
                                                                        .frame(width:50, height:60)
                                                                        .foregroundColor(.white)
                                                                )
                                                        }
                                                        Text(character.name ?? "")
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                            }
                                        }
                                        .padding(10)
                                    }
                                }
                            }
                            .padding(.vertical, 10)
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
        CharactersByHouse(house: "gryffindor", firstColor: "gryffindorFirst", secondColor: "gryffindorSecond")
    }
}

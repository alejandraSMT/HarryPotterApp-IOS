//
//  HogwartsHouses.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI
import UIKit

enum HogHauses: CaseIterable, Identifiable{
    case Gryffindor
    case Slytherin
    case Hufflepuff
    case Ravenclaw
    
    var id: Self {return self}
    
    var name: String{
        switch self {
        case .Gryffindor:
            return "Gryffindor"
        case .Slytherin:
            return "Slytherin"
        case .Hufflepuff:
            return "Hufflepuff"
        case .Ravenclaw:
            return "Ravenclaw"
        }
    }
    
    var imageString : String{
        switch self {
        case .Gryffindor:
            return "gryffindor"
        case .Slytherin:
            return "slytherin"
        case .Hufflepuff:
            return "hufflepuf"
        case .Ravenclaw:
            return "ravenclaw"
        }
    }
    var firstColor : String{
        switch self {
        case .Gryffindor:
            return "gryffindorFirst"
        case .Slytherin:
            return "slytherinFirst"
        case .Hufflepuff:
            return "hufflepuffFirst"
        case .Ravenclaw:
            return "ravenclawFirst"
        }
    }
    
    var sencondColor : String{
        switch self {
        case .Gryffindor:
            return "gryffindorSecond"
        case .Slytherin:
            return "slytherinSecond"
        case .Hufflepuff:
            return "hufflepuffSecond"
        case .Ravenclaw:
            return "ravenclawSecond"
        }
    }
    
    var darkerColor: String{
        switch self {
        case .Gryffindor:
            return "gryffindorDarker"
        case .Slytherin:
            return "slytherinDarker"
        case .Hufflepuff:
            return "hufflepuffDarker"
        case .Ravenclaw:
            return "ravenclawDarker"
        }
    }
}

struct HogwartsHouses: View {
    
    @State private var path = NavigationPath()
    private let adaptativeColumns = [GridItem(.adaptive(minimum: 170))]
    private let images = [UIImage(named: "image1"),UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4")]
    @State private var index = 0
    
    var body: some View {
        
        NavigationStack(path: $path){
            ZStack{
                Color("appBackground")
                    .ignoresSafeArea()
                VStack{
                    HeaderHouses()
                    
                    ScrollView(.vertical){
                        TabView{
                            ForEach(images, id:\.self){
                                image in
                                Image(uiImage: image!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 400)
                                    .frame(maxHeight: 250)
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal,20)
                        .frame(minHeight: 250)
                        .tabViewStyle(PageTabViewStyle())
                        LazyVGrid(columns: adaptativeColumns, spacing: 20){
                            ForEach(HogHauses.allCases){
                                house in
                                HouseCard(
                                    name: house.name,
                                    badge: house.imageString,
                                    firstColor: Color(house.firstColor),
                                    secondColor: Color(house.sencondColor))
                                .onTapGesture {
                                    path.append(HousesDestinations.characterByHouse(
                                        house: house.name.lowercased(),
                                        firstColor: house.firstColor,
                                        secondColor: house.sencondColor,
                                        darkerColor: house.darkerColor
                                    ))
                                    
                                }
                                
                            }
                            
                        }
                        .frame(maxHeight: .infinity)
                        .background(Color("appBackground"))
                        .padding(.top, 10)
                        .navigationDestination(for: HousesDestinations.self, destination: { views in
                            switch views {
                            case .characterByHouse(let house, let firstColor, let secondColor, let darkerColor):
                                CharactersByHouse(house: house, firstColor: firstColor, secondColor: secondColor, darkerColor: darkerColor , path: self.$path)
                            case .characterProfile(let id):
                                CharacterView(id: id)
                            }
                        })
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.top, 10)
                }
            }
        }
    }
}

struct HogwartsHouses_Previews: PreviewProvider {
    static var previews: some View {
        HogwartsHouses()
    }
}

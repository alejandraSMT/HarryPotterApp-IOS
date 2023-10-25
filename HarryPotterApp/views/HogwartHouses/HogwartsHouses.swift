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
}

struct HogwartsHouses: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            VStack(spacing: 0){
                Image(uiImage: UIImage(named: "hogwarts")!)
                        .resizable()
                        .frame(width: 400, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .cornerRadius(50)
                        .blur(radius: 1.5)
                        .overlay(
                            Text("Hogwarts Houses")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .white, radius: 3, x: 5, y: 4)
                        )
                        .background(Color("appBackground"))
                ZStack{
                    Color("appBackground")
                        .ignoresSafeArea()
                    VStack{
                        ScrollView{
                            VStack{
                                ForEach(HogHauses.allCases){
                                    house in
                                    HouseCard(
                                        name: house.name,
                                        badge: house.imageString,
                                        firstColor: Color(house.firstColor),
                                        secondColor: Color(house.sencondColor)
                                    )
                                    .onTapGesture {
                                        path.append(HousesDestinations.characterByHouse(
                                            house: house.name.lowercased(),
                                            firstColor: house.firstColor,
                                            secondColor: house.sencondColor
                                        ))
                                        }
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding(.top, 10)
                        .navigationDestination(for: HousesDestinations.self, destination: { views in
                            switch views {
                            case .characterByHouse(let house, let firstColor, let secondColor):
                                CharactersByHouse(house: house, firstColor: firstColor, secondColor: secondColor)
                            default:
                                ProgressView()
                            }
                            
                        })
                    }
                    
                }
            }
            .foregroundColor(Color("appBackground"))
            .edgesIgnoringSafeArea([.top, .trailing, .leading])
        }
    }
}

struct HogwartsHouses_Previews: PreviewProvider {
    static var previews: some View {
        HogwartsHouses()
    }
}

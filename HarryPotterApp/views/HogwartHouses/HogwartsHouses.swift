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
    var firstColor : Color{
        switch self {
        case .Gryffindor:
            return Color("gryffindorFirst")
        case .Slytherin:
            return Color("slytherinFirst")
        case .Hufflepuff:
            return Color("hufflepuffFirst")
        case .Ravenclaw:
            return Color("ravenclawFirst")
        }
    }
    
    var sencondColor : Color{
        switch self {
        case .Gryffindor:
            return Color("gryffindorSecond")
        case .Slytherin:
            return Color("slytherinSecond")
        case .Hufflepuff:
            return Color("hufflepuffSecond")
        case .Ravenclaw:
            return Color("ravenclawSecond")
        }
    }
}

struct HogwartsHouses: View {
    
//    var houses: [Houses] = [.init(name: "Gryffindow", badge: UIImage(named: "gryffindor")!),
//        .init(name: "Slytherin", badge: UIImage(named: "slytherin")!),
//        .init(name: "Hufflepuff", badge: UIImage(named: "hufflepuf")!),
//        .init(name: "Ravenclaw", badge: UIImage(named: "ravenclaw")!)
//    ]
    
    var body: some View {
        
        VStack{
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
//            ScrollView(.horizontal){
//                LazyHStack(spacing: 20){
//                    ForEach(HogHauses.allCases){
//                        house in
//                        HouseCard(
//                            name: house.name,
//                            badge: house.imageString,
//                            firstColor: house.firstColor,
//                            secondColor: house.sencondColor
//                        )
//                    }
//                }
//            }.padding(20)
            List{
                ForEach(HogHauses.allCases){
                    house in
                    HouseCard(
                        name: house.name,
                        badge: house.imageString,
                        firstColor: house.firstColor,
                        secondColor: house.sencondColor
                    )
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color("appBackground"))
        }
        .background(Color("appBackground"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct HogwartsHouses_Previews: PreviewProvider {
    static var previews: some View {
        HogwartsHouses()
    }
}

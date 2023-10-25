//
//  CardCharacterByHouse.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 25/10/23.
//

import SwiftUI

struct CardCharacterByHouse: View {
    
    var character : Character
    
    var body: some View {
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

struct CardCharacterByHouse_Previews: PreviewProvider {
    static var previews: some View {
        CardCharacterByHouse(character: Character(id: "", name: "", species: "", gender: "", house: "", dateOfBirth: "", wizard: false, ancestry: "", patronus: "", hogwartsStudent: false, hogwartsStaff: false, actor: "", alive: false, image: "", wand: Wand(wood: "", core: "", length: 0.0)))
    }
}

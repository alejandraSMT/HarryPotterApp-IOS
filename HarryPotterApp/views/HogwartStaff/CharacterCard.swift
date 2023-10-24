//
//  CharacterCard.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct CharacterCard: View {
    var staff : Character
    
    func validateHouse() -> String? {
        if(staff.house == ""){
            return "No house"
        }
        return staff.house
    }
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: staff.image ?? "")){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.horizontal,10)
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 50,height: 50)
            }
            VStack(alignment: .leading){
                Text("\(staff.name ?? "Unnamed")")
                    .font(.subheadline)
                Text("Species: \(staff.species?.capitalized ?? "No species") - House: \(validateHouse() ?? "No house")")
                    .font(.caption)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(Color("listColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard(staff: Character(id: "1", name: "", species: "", gender: "", house: "", dateOfBirth: "", wizard: true, ancestry: "", patronus: "", hogwartsStudent: true, hogwartsStaff: true, actor: "", alive: true, image: "", wand:  Wand(wood: "", core: "", length: 0.0)))
    }
}

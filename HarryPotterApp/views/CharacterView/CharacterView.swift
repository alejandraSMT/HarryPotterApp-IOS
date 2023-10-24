//
//  CharacterView.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct CharacterView: View {
    
    @State var id: String
    @ObservedObject var characterViewModel: CharacterViewModel
    
    init(id: String){
        self.id = id
        self.characterViewModel = CharacterViewModel(characterId: id)
    }
    
    var body: some View {
        VStack(alignment: .center){
            if !self.characterViewModel.isLoadingCharacter{
                ScrollView{
                    Text("\(characterViewModel.character?.name ?? "Unnamed")")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(2)
                    Text("Born: \(characterViewModel.character?.dateOfBirth ?? "Not especified") - \( characterViewModel.character?.gender?.capitalized ?? "Not especified" )")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    CharacterPhotoFrame(
                        photoUrl: characterViewModel.character?.image ?? "",
                        house: characterViewModel.character?.house
                    )
                        .padding(.bottom, 20)
                    CharacterInfo(
                        species: characterViewModel.character?.species ?? "Not specified",
                        status: characterViewModel.character?.alive,
                        patronus: characterViewModel.character?.patronus
                    )
                        .padding(.bottom, 20)
                    if(characterViewModel.character?.wand.core != "" || characterViewModel.character?.wand.wood != "" || characterViewModel.character?.wand.length != nil){
                        WandInfo(
                            wand: characterViewModel.character?.wand
                        )
                    }
                }
                .scrollIndicators(.hidden)
                .padding(20)
            } else {
                ProgressView()
                    .tint(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("appBackground"))
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(id:"1")
    }
}

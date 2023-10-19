//
//  CharacterView.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        VStack(alignment: .center){
            ScrollView{
                Text("Harry Potter")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(2)
                Text("Born: 31 - 07 - 1980   -  Male")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                CharacterPhotoFrame()
                    .padding(.bottom, 20)
                CharacterInfo()
                    .padding(.bottom, 20)
                WandInfo()
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .background(Color("appBackground"))
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}

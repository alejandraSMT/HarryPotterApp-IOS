//
//  WandInfo.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct WandInfo: View {
    var body: some View {
        VStack(alignment: .center, spacing: 2){
            Rectangle()
                .frame(width: 110, height: 50)
                .cornerRadius(20)
                .foregroundColor(Color(hex:"6F7C9D"))
                .overlay(
                    Text("Wand: ")
                        .font(.title3)
                        .foregroundColor(.white)
                )
                .padding(.bottom, 10)
            Text("11 inch wand made of holly wood with phoenix feather core")
                .font(.title3)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 300)
    }
}

struct WandInfo_Previews: PreviewProvider {
    static var previews: some View {
        WandInfo()
    }
}

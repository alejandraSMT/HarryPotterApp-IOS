//
//  CharacterInfo.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct CharacterInfo: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(alignment: .center, spacing: 40){
                Rectangle()
                    .frame(width: 110, height: 50)
                    .cornerRadius(20)
                    .foregroundColor(Color(hex:"9D826F"))
                    .overlay(
                        Text("Species: ")
                            .font(.title3)
                            .foregroundColor(.white)
                    )
                HStack(alignment: .center){
                    Text("Human")
                    .font(.title3)
                    .foregroundColor(.white)
                }
            }
            HStack(alignment: .center, spacing: 40){
                Rectangle()
                    .frame(width: 110, height: 50)
                    .cornerRadius(20)
                    .foregroundColor(Color(hex:"9C9D6F"))
                    .overlay(
                        Text("Status: ")
                            .font(.title3)
                            .foregroundColor(.white)
                    )
                Text("Alive")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            HStack(alignment: .center, spacing: 40){
                Rectangle()
                    .frame(width: 110, height: 50)
                    .cornerRadius(20)
                    .foregroundColor(Color(hex:"6F9D98"))
                    .overlay(
                        Text("Patronus: ")
                            .font(.title3)
                            .foregroundColor(.white)
                    )
                Text("Stag")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct CharacterInfo_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfo()
    }
}

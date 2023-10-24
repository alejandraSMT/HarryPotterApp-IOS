//
//  WandInfo.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct WandInfo: View {
    
    var wand: Wand?
    
    func validateLength() -> String? {
        if(self.wand?.length == nil){
            return ""
        }
        return "\(String(describing: self.wand?.length)) inch "
    }
    
    func validateWood() -> String {
        if(self.wand?.wood == ""){
            return ""
        }
        return " made of \(String(describing: self.wand?.wood ?? "no wood")) "
    }
    
    func validateCore() -> String {
        if(self.wand?.core == ""){
            return ""
        }
        return "with \(String(describing: self.wand?.core ?? "no")) core."
    }
    
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
            
            Text(String.getFinalString(wand: wand ?? Wand(wood: nil, core: nil, length: nil)))
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 300)
    }
    
}

struct WandInfo_Previews: PreviewProvider {
    static var previews: some View {
        WandInfo(wand: Wand(wood: "", core: "", length: 0.0))
    }
}

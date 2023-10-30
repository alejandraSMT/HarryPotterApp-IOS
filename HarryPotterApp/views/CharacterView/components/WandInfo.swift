//
//  WandInfo.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct WandInfo: View {
    
    var wand: Wand?
    
//    func validateLength() -> String{
//        if(self.wand?.length == nil){
//            return "No length specified"
//        }
//        return "\(self.wand?.length)"
//    }
    
    func validateWood() -> String{
        if(self.wand?.wood == "" || self.wand?.wood == nil){
            return "No wood specified"
        }
        return (self.wand?.wood)!.capitalized
    }
    
    func validateCore() -> String{
        if(self.wand?.core == "" || self.wand?.wood == nil){
            return "No core specified"
        }
        return (self.wand?.core)!.capitalized
    }
    
    
    var body: some View {
        let lengthString = self.wand?.length.map { String($0) } ?? "No length specified"
        
        VStack(alignment: .leading){
            Text("Wand: ")
                .foregroundColor(.white)
                .font(.title3)
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("Wood: ")
                            .foregroundColor(.gray)
                        Text(validateWood())
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Length: ")
                            .foregroundColor(.gray)
                        Text(lengthString)
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Core: ")
                            .foregroundColor(.gray)
                        Text(validateCore())
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Image(uiImage: UIImage(named: "wand")!)
                    .resizable()
                    .frame(maxWidth: 70, maxHeight: 100)
                    .scaledToFit()
            }
        }
        .padding(20)
        .background(Color("wandColor"))
        .cornerRadius(20)
    }
    
}

struct WandInfo_Previews: PreviewProvider {
    static var previews: some View {
        WandInfo(wand: Wand(wood: "", core: "", length: 0.0))
    }
}

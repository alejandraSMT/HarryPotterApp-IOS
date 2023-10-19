//
//  HouseCard.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct HouseCard: View {
    
    var name: String
    var badge : String
    var firstColor : Color
    var secondColor : Color
    
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Image(badge)
                    .resizable()
                    .frame(width: 140,height: 140)
            }
            .frame(width: 350, height: 180)
            .background(
                LinearGradient(gradient: Gradient(colors: [firstColor,secondColor]), startPoint: .top, endPoint: .bottom)
                )
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
            .overlay(
                LinearGradient(gradient: Gradient(stops: [
                                Gradient.Stop(color: Color(white: 0, opacity: 0),
                                              location: 0.6),
                                Gradient.Stop(color: Color(white: 0, opacity: 0.25),
                                              location: 1),
                            ]), startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
            )
            .ignoresSafeArea()
            Text("\(name)")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
        }
        .padding(2)
        
        
//        VStack(alignment: .leading){
//            Image(badge)
//                .resizable()
//                .frame(width: 120,height: 120)
//        }
//        .frame(width: 300, height: 300)
//        .background(
//            LinearGradient(gradient: Gradient(colors: [firstColor,secondColor]), startPoint: .top, endPoint: .bottom)
//            )
//        .clipShape(RoundedRectangle(cornerRadius: 30.0))
//        .overlay(
//            LinearGradient(gradient: Gradient(stops: [
//                            Gradient.Stop(color: Color(white: 0, opacity: 0),
//                                          location: 0.6),
//                            Gradient.Stop(color: Color(white: 0, opacity: 0.25),
//                                          location: 1),
//                        ]), startPoint: .top, endPoint: .bottom)
//        )
//        .ignoresSafeArea()
    }
}

struct HouseCard_Previews: PreviewProvider {
    static var previews: some View {
        HouseCard(name:"Gryffindor",badge:"gryffindor",firstColor: Color("gryffindorFirst"),secondColor: Color("gryffindorSecond"))
    }
}

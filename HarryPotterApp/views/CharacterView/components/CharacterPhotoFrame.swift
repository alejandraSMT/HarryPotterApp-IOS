//
//  CharacterPhotoFrame.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct CharacterPhotoFrame: View {
    var body: some View {
        VStack(spacing: 0){
            AsyncImage(url: URL(string:"https://ik.imagekit.io/hpapi/harry.jpg")){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 220)
                    .border(Color("frameCharacter"), width: 5)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            } placeholder: {
                Rectangle()
                    .frame(width: 200, height: 220)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            Rectangle()
                .frame(width: 200, height: 50)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .foregroundColor(Color("characterColor"))
                .overlay(
                    Text("Gryffindor")
                        .font(.title3)
                )
        }
    }
}

fileprivate extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }

    func getFrameBorderPainted() -> some View{
        self
            .overlay {
            Rectangle().stroke(Color.red, lineWidth: 2)
        }
    }

}

fileprivate struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CharacterPhotoFrame_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPhotoFrame()
    }
}
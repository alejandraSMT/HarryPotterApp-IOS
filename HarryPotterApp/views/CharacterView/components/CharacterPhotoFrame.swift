//
//  CharacterPhotoFrame.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 19/10/23.
//

import SwiftUI

struct CharacterPhotoFrame: View {
    
    var photoUrl : String
    var house : String?
    
    func validateHouse() -> String? {
        if(self.house == "" || self.house == nil){
            return "No house"
        }
        return self.house
    }
    
    var body: some View {
        VStack(spacing: 0){
            AsyncImage(url: URL(string:"\(photoUrl)")){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 200)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
            } placeholder: {
                Rectangle()
                    .frame(width: 170, height: 200)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .overlay(
                        Image(uiImage: UIImage(named: "hpLogo")!)
                            .resizable()
                            .frame(width: 60, height: 70)
                    )
            }
            Rectangle()
                .frame(width: 170, height: 30)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .foregroundColor(Color("characterColor"))
                .overlay(
                    Text(validateHouse()!)
                        .font(.subheadline)
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
        CharacterPhotoFrame(photoUrl: "", house: "")
    }
}

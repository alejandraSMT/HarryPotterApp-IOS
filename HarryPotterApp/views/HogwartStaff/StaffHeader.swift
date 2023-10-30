//
//  StaffHeader.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 30/10/23.
//

import SwiftUI

struct StaffHeader: View {
    var body: some View {
        HStack(alignment: .center){
            Image(uiImage: UIImage(named: "houses_icon")!)
                .resizable()
                .frame(maxWidth: 30, maxHeight: 30)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
            Text("Hogwarts Staff")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.vertical, 10)
            Spacer()
            
        }
        .background(Color("topBarColor"))
        .frame(maxWidth: .infinity)
    }
}

struct StaffHeader_Previews: PreviewProvider {
    static var previews: some View {
        StaffHeader()
    }
}

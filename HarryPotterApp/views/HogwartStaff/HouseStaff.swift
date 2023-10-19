//
//  HouseStaff.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct HouseStaff: View {
    
    @StateObject var staffViewModel = StaffViewModel()
    
    var body: some View {
        VStack(spacing: 2){
            Text("Hogwarts Staff")
                .font(.title)
                .bold()
                .foregroundColor(Color.white)
                .padding(.top,10)
            List{
                ForEach(staffViewModel.staffList, id: \.id){
                    staff in
                    CharacterCard(staff: staff)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color("appBackground"))
        }
        .background(Color("appBackground"))
    }
}

struct HouseStaff_Previews: PreviewProvider {
    static var previews: some View {
        HouseStaff()
    }
}

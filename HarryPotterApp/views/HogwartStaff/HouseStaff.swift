//
//  HouseStaff.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct HouseStaff: View {
    
    @StateObject var staffViewModel = StaffViewModel()
    
    /*@State private var path = NavigationPath()
    @StateObject var router: RoutingViewModel*/
    //@State private var path = [HousesDestinations]()
    
    @State private var path = NavigationPath()

    
    var body: some View {
        NavigationStack(path: $path){
           ZStack{
               
               Color("appBackground")
                   .ignoresSafeArea()
               
               VStack(spacing: 20){
                   Text("Hogwarts Staff")
                           .font(.title)
                           .bold()
                           .foregroundColor(Color.white)
                           .padding(.top,10)
                    ScrollView{
                        VStack(spacing: 20){
                            ForEach(staffViewModel.staffList, id: \.id){
                                staff in
                                CharacterCard(staff: staff)
                                .onTapGesture {
                                    path.append(HousesDestinations.characterProfile(id: staff.id))
                                    }
                            }
                        }
                    }
                    .navigationDestination(for: HousesDestinations.self, destination: { caso in
                        switch caso{
                        case .characterProfile(let id):
                            CharacterView(id: id)
                        }
                    })
                }
                .padding(20)
           }
        }
    }
}

enum HousesDestinations: Hashable{
    case characterProfile(id: String)
}

struct HouseStaff_Previews: PreviewProvider {
    static var previews: some View {
        HouseStaff()
    }
}

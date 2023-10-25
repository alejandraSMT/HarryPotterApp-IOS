//
//  HouseStaff.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct HouseStaff: View {
    
    @StateObject var staffViewModel = StaffViewModel()
    
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
                   if(!staffViewModel.isLoading){
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
                        .navigationDestination(for: HousesDestinations.self, destination: { views in
                            switch views {
                            case .characterProfile(let id):
                                CharacterView(id: id)
                            default:
                                ProgressView()
                            }
                            
                        })
                   }else{
                       ProgressView()
                           .tint(.white)
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                   }
                }
                .padding(20)
           }
        }
    }
}

struct HouseStaff_Previews: PreviewProvider {
    static var previews: some View {
        HouseStaff()
    }
}

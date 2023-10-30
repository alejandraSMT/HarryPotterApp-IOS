//
//  HousesDestination.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 24/10/23.
//

import Foundation

enum HousesDestinations: Hashable{
    case characterProfile(id: String)
    case characterByHouse(house: String, firstColor: String, secondColor: String, darkerColor: String)
}

//
//  Character.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import Foundation

struct Character: Hashable, Decodable{
    let id : String?
    let name: String?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let wizard : Bool?
    let ancestry: String?
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alive: Bool?
    let image: String?
}

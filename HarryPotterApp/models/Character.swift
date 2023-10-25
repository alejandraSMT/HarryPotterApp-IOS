//
//  Character.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import Foundation

struct Character: Hashable, Decodable, Identifiable{
    let id : String
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
    let wand: Wand
}

struct Wand: Hashable, Decodable{
    let wood: String?
    let core: String?
    let length : Double?
}

extension String{
    static func getFinalString(wood: String?, core: String?, length: Double?) -> String{
        
        var final = ""
        
        if let length{
            final.append("\(String(length)) inch(es) ")
        }
        final.append("wand ")
        
        if let wood{
            if !wood.isEmpty{
                final.append("made of ")
                final.append(wood.capitalized)
                final.append(" ")
            }
        }
        
        if let core{
            if !core.isEmpty{
                final.append("with")
                final.append(" \(core.capitalized)")
                final.append(" core")
            }
        }
        
        return final
    }
    
    static func getFinalString(wand: Wand) -> String{
        
        var final = ""
        
        if let length = wand.length{
            final.append("\(String(length)) inch(es) ")
        }
        final.append("wand ")
        
        if let wood = wand.wood{
            if !wood.isEmpty{
                final.append("made of ")
                final.append(wood.capitalized)
                final.append(" ")
            }
        }
        
        if let core = wand.core{
            if !core.isEmpty{
                final.append("with")
                final.append(" \(core.capitalized)")
                final.append(" core")
            }
        }
        
        return final
    }
}

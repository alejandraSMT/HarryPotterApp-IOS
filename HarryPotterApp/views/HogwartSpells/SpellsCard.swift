//
//  SpellsCard.swift
//  HarryPotterApp
//
//  Created by Alejandra San Martin on 16/10/23.
//

import SwiftUI

struct SpellsCard: View {
    
    var spell : Spell
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("\(spell.name ?? "Unnamed")")
                .font(.subheadline)
            Text("\(spell.description ?? "")")
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color("listColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

struct SpellsCard_Previews: PreviewProvider {
    static var previews: some View {
        SpellsCard(spell: Spell(id: "1", name: "Prueba", description: "Prueba"))
    }
}

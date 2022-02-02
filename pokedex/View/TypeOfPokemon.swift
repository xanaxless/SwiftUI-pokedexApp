//
//  TypeOfPokemon.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 15.01.2022.
//

import SwiftUI

struct TypeOfPokemon: View {
    var type: String
    var color: UIColor
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(color))
                .frame(width: 150, height: 50)
            HStack( spacing: 15){
                Image(systemName: "flame.fill").resizable().scaledToFit().frame(width: 25, height: 25)
                Text(type)
            }
        }
    }
}

struct TypeOfPokemon_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfPokemon(type: "poison", color: .systemGreen)
    }
}

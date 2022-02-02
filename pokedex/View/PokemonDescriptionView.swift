//
//  PokemonDescriptionView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 13.01.2022.
//

import SwiftUI
import Kingfisher

struct PokemonDescriptionView: View {
    var pokemon: Pokemon
    var backgroundColor: UIColor{
        pokedex.backgroundColor(forType: pokemon.type)
    }
    var body: some View {
        GeometryReader { geo in
            VStack {
                KFImage(URL(string: pokemon.imageUrl)).padding(.bottom, -50).padding(.top, 50).zIndex(1)
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: 50).frame(width: geo.size.width, height: geo.size.height)
                        .ignoresSafeArea()
                        .foregroundColor(.white)
                    VStack(spacing: 20){
                        Text(pokemon.name).font(.largeTitle)
                        TypeOfPokemon(type: pokemon.type, color: backgroundColor)
                        Text(pokemon.description).padding(.horizontal)
                        StatView(weight: pokemon.weight, attack: pokemon.attack, defence: pokemon.defense, height: pokemon.height)
                    }.padding(.top, 50)
                }
            }.background(Color(backgroundColor))
        }.ignoresSafeArea()
    }
}

struct PokemonDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonDescriptionView(pokemon: mock_pokemon[0])
        }
    }
}

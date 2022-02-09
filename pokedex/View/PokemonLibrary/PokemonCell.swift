//
//  PokemonCell.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 10.01.2022.
//

import SwiftUI
import Kingfisher
struct PokemonCell: View {
    var pokemon: Pokemon
    var viewModel: PokemonLibraryViewModel
    var backgroundColor: Color
    init(pokemon: Pokemon, viewModel: PokemonLibraryViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(PokemonLibraryViewModel().backgroundColor(forType: pokemon.type))
    }
    var body: some View {
        NavigationLink(destination: PokemonDescriptionView(pokemon: pokemon)) {
            ZStack{
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .padding(.top, 8)
                        .padding(.leading)
                        .foregroundColor(.white)
                    HStack {
                        Text(pokemon.type)
                            .foregroundColor(.white)
                            .font(.footnote).bold()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                Rectangle()
                                    .fill(.white.opacity(0.25))
                                    .cornerRadius(10)
                            )
                            .frame(width: 100, height: 24)
                        KFImage(URL(string: pokemon.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding([.trailing,.bottom], 8)
                    }
                }
            }.background(backgroundColor)
                .cornerRadius(20)
                .shadow(color: backgroundColor, radius: 10, x: 0.0, y: 0.0)
        }

       
    }
}


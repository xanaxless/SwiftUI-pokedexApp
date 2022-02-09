//
//  PokemonLibrary.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 02.02.2022.
//

import SwiftUI

struct PokemonLibrary: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonLibraryViewModel()
    init() {
        viewModel.fetchPokemon()
        viewModel.isLiked()
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color(.white)
            ScrollView{
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Pokedex")
            Button {
                viewModel.sorting()
            } label: {
                ZStack {
                    Circle().fill(.indigo).frame(width: 90).overlay {
                        Image(systemName: "list.number").resizable().scaledToFill().padding(.all, 30).foregroundColor(.white)
                    }
                }
            }.frame(width: 100, height: 100).padding(.horizontal)
        }
    }
}

struct PokemonLibrary_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLibrary()
    }
}

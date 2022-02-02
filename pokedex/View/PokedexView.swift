//
//  PokedexView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 13.01.2022.
//

import SwiftUI

struct PokedexView: View {
    
    @State private var isShowing = false
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    init() {
        viewModel.fetchPokemon()
    }
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing
                {
                    SideMenuView(isShowing: $isShowing)
                }
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
                .cornerRadius(isShowing ? 20 : 0)
                .scaleEffect(isShowing ? 0.8 : 1)
                .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                .toolbar {
                    ToolbarItem( placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.spring()) {
                                isShowing.toggle()
                            }
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

//
//  PokedexView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 13.01.2022.
//

import SwiftUI

struct PokedexView: View {
    
    @State private var isShowing = false
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing
                {
                    SideMenuView(isShowing: $isShowing)
                }
                PokemonLibrary()
    
                    .cornerRadius(isShowing ? 20 : 0)
                .edgesIgnoringSafeArea([.bottom])
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
        .navigationBarHidden(true)
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

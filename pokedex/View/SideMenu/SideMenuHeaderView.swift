//
//  SideMenuHeaderView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 24.01.2022.
//

import SwiftUI
import Firebase
struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    let user = Auth.auth().currentUser
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            Button {
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    
            }
            VStack(alignment: .leading) {
                Image("bulbasaur")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                    .padding(.bottom, 20)
                Text("\(user?.email ?? "Pokemon")")
                    .font(.system(size: 24, weight: .semibold))
                Text("@xanaxless")
                    .font(.system(size: 14))
                    .padding(.bottom)
                HStack(spacing: 12){
                    HStack(spacing:4){
                        Text("21").bold()
                        Text("Pokemons")
                    }
                    Spacer()
                }
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}

//
//  SideMenuView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 24.01.2022.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    let menu: [String] = ["Profile", "Library", "Competition", "Settings"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.gray, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                ForEach(menu, id: \.self) { name in
                    SideMenuOptionView(nameOfField: name)
                }
                Spacer()
            }
            
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}

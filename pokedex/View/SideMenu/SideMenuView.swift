//
//  SideMenuView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 24.01.2022.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    let menu: [String : String] = ["Profile": "person", "Library":"text.book.closed.fill", "Log out": "rectangle.portrait.and.arrow.right"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .green, .gray ,.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                SideMenuOptionView(nameOfField: "Profile" , nameOfImage:menu["Profile"] ?? "")
                SideMenuOptionView(nameOfField: "Library", nameOfImage:menu["Library"] ?? "")
                SideMenuOptionView(nameOfField: "Log out", nameOfImage:menu["Log out"] ?? "")
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

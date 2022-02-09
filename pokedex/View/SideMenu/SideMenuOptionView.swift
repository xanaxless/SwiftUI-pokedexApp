//
//  SideMenuOptionView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 24.01.2022.
//

import SwiftUI

struct SideMenuOptionView: View {
    var nameOfField: String
    var nameOfImage: String
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: nameOfImage)
                .frame(width: 24, height: 24)
            Text(nameOfField)
                .font(.system(size:15, weight: .semibold))
            Spacer()
        }.foregroundColor(.white)
            .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(nameOfField: "Profile", nameOfImage: "People")
    }
}

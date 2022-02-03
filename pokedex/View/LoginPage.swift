//
//  LoginPage.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 03.02.2022.
//

import SwiftUI

struct LoginPage: View {
    @State var email: String = ""
    @State var password: String = ""
    private let title: String = "Enter Password"
    @State private var isSecured: Bool = true
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Text("Log in to Pokedex")
                .font(.title)
            Text("Email:")
                .font(.callout)
                .foregroundColor(.gray)
            TextField("Enter email",text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250, height: 20)
                .shadow(radius: 10)
            Text("Password:")
                .font(.callout)
                .foregroundColor(.gray)
            ZStack(alignment: .trailing) {
                        if isSecured {
                            SecureField(title, text: $password)
                        } else {
                            TextField(title, text: $password)
                        }
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250, height: 20)
            .shadow(radius: 10)
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 50)
                    .shadow(radius: 10)
                    .overlay {
                        Text("login")
                            .foregroundColor(.white)
                    }
            }
            .frame(width: 240, height: 60, alignment: .center)

            
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

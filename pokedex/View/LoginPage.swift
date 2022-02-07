//
//  LoginPage.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 03.02.2022.
//

import SwiftUI
import Combine



struct LoginPage: View {
    @State var email: String = ""
    @State var password: String = ""
    private let title: String = "Enter Password"
    @State private var isSecured: Bool = true
    @State private var isLoginPage = true
    @ObservedObject var loginModelView = LoginPageViewModel()
    var body: some View {
        VStack {
            if !loginModelView.shouldNavigate {
                VStack(alignment: .leading, spacing: 30){
                    Text("\(isLoginPage ? "Login" : "Register") to Pokedex")
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
                        withAnimation(.spring()) {
                            loginModelView.register(email: email, password: password)
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 50)
                            .shadow(radius: 10)
                            .overlay {
                                Text(isLoginPage ? "Login" : "Register")
                                    .foregroundColor(.white)
                            }
                    }
                    .frame(width: 240, height: 50, alignment: .center)
                    Button {
                        isLoginPage.toggle()
                    } label: {
                        Text(isLoginPage ? "Register" : "Login")
                    }
                    .frame(width: 240, height: 20, alignment: .center)

                }
                
            } else {
                PokedexView()
            }
        }
        
        
    }
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

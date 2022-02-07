//
//  LoginPageViewModel.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 04.02.2022.
//

import Foundation
import Firebase

class LoginPageViewModel:ObservableObject {
    @Published var shouldNavigate: Bool = false
    
    func register(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.shouldNavigate.toggle()
        }
    }
     
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            else {
                self?.shouldNavigate.toggle()
            }
        }
    }
    
}

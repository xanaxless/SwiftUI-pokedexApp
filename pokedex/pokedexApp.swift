//
//  pokedexApp.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 10.01.2022.
//

import SwiftUI
import Firebase
@main
struct pokedexApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
           PokedexView()
        }
    }
}

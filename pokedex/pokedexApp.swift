//
//  pokedexApp.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 10.01.2022.
//

import SwiftUI

@main
struct pokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           PokedexView()
        }
    }
}

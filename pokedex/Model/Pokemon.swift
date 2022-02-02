//
//  Pokemon.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 10.01.2022.
//

import Foundation
struct Pokemon:Decodable, Identifiable{
    let name : String
    let id : Int
    let type: String
    let imageUrl: String
    let description: String
    let attack : Int
    let defense: Int
    let height: Int
    let weight: Int
}



let mock_pokemon : [Pokemon] = [
    .init(name: "Bulbasaur", id: 1, type: "poison", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.", attack: 11, defense: 22, height: 7, weight: 23)
]

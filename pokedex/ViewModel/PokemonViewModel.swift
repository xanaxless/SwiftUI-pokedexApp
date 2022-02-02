//
//  PokemonViewModel.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 13.01.2022.
//

import SwiftUI
class PokemonViewModel : ObservableObject{
    @Published var pokemon = [Pokemon]()
    var num = 1
    let baseurl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    func fetchPokemon(){
        guard let url = URL(string: baseurl) else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.parseData(removeString: "null,")
            else {
                print("fail1")
                return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data)
            else {
                print("fail2")
                return }
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
            
        }.resume()
    }
     func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "psychis": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
}


extension Data{
    func parseData(removeString string: String ) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}

extension PokemonViewModel {
    func changeForOne(){
        num = (num+1) % 3
    }
    func sorting(){
        if (num == 0 ){
            pokemon.sort { pokemon1, pokemon2 in
                return (pokemon1.id>pokemon2.id)
            }
        }
        else if( num == 1){
            pokemon.sort { pokemon1, pokemon2 in
                return (pokemon1.type == "fire") ? true : false
            }
        }
        else{
            pokemon.sort { pokemon1, pokemon2 in
                return (pokemon1.id<pokemon2.id)
            }
        }
        changeForOne()
    }
}

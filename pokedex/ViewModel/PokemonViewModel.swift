//
//  PokemonViewModel.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 13.01.2022.
//

import SwiftUI
import Firebase
class PokemonLibraryViewModel : ObservableObject{
    @Published var pokemon = [Pokemon]()
    var num = 1
    var listOfLikedPokemons = [Int]()
    let baseurl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
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
        case "flying": return .systemCyan
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

extension PokemonLibraryViewModel {
    func changeForOne(){
        num = (num+1) % 3
    }
    
    
    func typeSortingTool(type:String) -> Int{
        switch type {
        case "fire": return 1
        case "poison": return 2
        case "water": return 3
        case "electric": return 4
        case "psychis": return 5
        case "normal": return 6
        case "ground": return 7
        case "flying": return 8
        case "fairy": return 9
        default: return 10
        }
    }
    
    func sorting(){
        if (num == 0 ){
            pokemon.sort { pokemon1, pokemon2 in
                return (pokemon1.id>pokemon2.id)
            }
        }
        else if( num == 1){
            pokemon.sort { pokemon1, pokemon2 in
                return typeSortingTool(type: pokemon1.type)<typeSortingTool(type: pokemon2.type)
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


extension PokemonLibraryViewModel{
    
    func isLiked(){
        db.collection(Constans.collectionForLiked).document("\(user?.email ?? "Pokemon")").getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.listOfLikedPokemons =  data["ids"] as! [Int] 
                } else {
                    print("Document does not exist")
                }
            }
            
        }
        print("the list")
        print(listOfLikedPokemons)
    }
}

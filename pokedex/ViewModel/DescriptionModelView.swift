//
//  DescriptionModelView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 07.02.2022.
//

import Foundation
import Firebase
class DescriptionModelView: ObservableObject{
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    @Published var isLiked: Bool = false
    func sendLikedPokemon(id: Int) {
        db.collection(Constans.collectionForLiked).document("\(user?.email ?? "Pokemon")").updateData([
            "ids": FieldValue.arrayUnion([id])
        ])
        isLiked = true
    }
    
    func deleteLikedPokemon(id: Int) {
        db.collection(Constans.collectionForLiked).document("\(user?.email ?? "Pokemon")").updateData([
            "ids": FieldValue.arrayRemove([id])
        ])
        isLiked = false 
    }
    
}

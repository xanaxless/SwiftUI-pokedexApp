//
//  Needed func .swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 14.01.2022.
//

import Foundation
import SwiftUI

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

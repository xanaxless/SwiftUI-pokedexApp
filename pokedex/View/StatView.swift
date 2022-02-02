//
//  StatView.swift
//  pokedex
//
//  Created by Yerkebulan Serikov on 18.01.2022.
//

import SwiftUI

struct StatView: View {
    var weight: Int
    var attack: Int
    var defence: Int
    var height: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .fill(.white).shadow(radius: 10)
                .frame(width: 350, height: 250).overlay {
                    VStack{
                        HStack{
                            Text("Weight").foregroundColor(.gray).monospacedDigit().frame(width: 70, alignment: .leading)
                            Text("\(weight)").monospacedDigit().padding(.trailing,20).frame(width:55)
                            ProgressView(value: Double(weight)/100.0 ).tint((weight<50) ? .red : .green)
                            
                        }
                        HStack{
                            Text("Attack").foregroundColor(.gray).monospacedDigit().frame(width: 70, alignment: .leading)
                            Text("\(attack)").monospacedDigit().padding(.trailing,20).frame(width:55)
                            ProgressView(value: Double(attack)/100.0).tint((attack<50) ? .red : .green)
                        }
                        HStack{
                            Text("Defence").foregroundColor(.gray).monospacedDigit()
                                .frame(width: 70, alignment: .leading)
                            Text("\(defence)").monospacedDigit().padding(.trailing,20).frame(width:55)
                            ProgressView(value: Double(defence)/100.0).tint((defence<50) ? .red : .green)
                        }
                        HStack{
                            Text("Height").foregroundColor(.gray).monospacedDigit()
                                .frame(width: 70, alignment: .leading)
                            Text("\(height)").monospacedDigit().padding(.trailing,20).frame(width:55)
                            ProgressView(value: Double(height)/100.0).tint((height<50) ? .red : .green)
                        }
                    }.padding()
                }
        }
    }
}



struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(weight: 140, attack: 30, defence: 60, height: 70)
    }
}

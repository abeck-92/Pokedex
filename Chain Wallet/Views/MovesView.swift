//
//  MovesView.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/9/22.
//

import SwiftUI

struct MovesView: View {
    @State var singlePokemon: SinglePokemon
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)

                if let pokemon = singlePokemon {
                    VStack {
                        AsyncImage(url: URL(string: pokemon.sprites.front_default)!,
                                   placeholder: { Image("pokeball") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(width: 250, height: 250)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        Text("Moves").font(Font.custom("Pokemon Solid", size: 34))
                        List(pokemon.moves) { move in
                            VStack(alignment: .leading) {
                                Text(move.move.name.capitalizingFirstLetter()).font(Font.custom("Pokemon Solid", size: 22))
                                    .padding()
                                    .padding(.bottom, -30)
                                Text("Move Learned By: \(move.version_group_details[0].move_learn_method.name)").font(Font.custom("Pokemon Solid", size: 16))
                                    .padding()
                                    .padding(.bottom, -30)
                                Text("Level learned at: \(move.version_group_details[0].level_learned_at)").font(Font.custom("Pokemon Solid", size: 16))
                                    .padding()
                            }
                            .listRowBackground(Color.white)
                        }.listStyle(.insetGrouped)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
           .toolbar(content: {
              ToolbarItem (placement: .navigation)  {
                 Image(systemName: "arrow.left")
                 .foregroundColor(.yellow)
                 .onTapGesture {
                     // code to dismiss the view
                     self.presentation.wrappedValue.dismiss()
                 }
              }
           })
    }
}

//struct MovesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovesView(singlePokemon: testSinglePokemon)
//    }
//}

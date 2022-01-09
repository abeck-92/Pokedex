//
//  MovieView.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/9/22.
//

import SwiftUI

struct PokemonView: View {
    @State var singlePokemon: SinglePokemon?
    @Environment(\.presentationMode) var presentation
    var url: String
    var name: String
    
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)

            if singlePokemon == nil {
                Image("pokeball")
                    .onAppear {
                        API().getPokemon(url: url) { (pokemon) in
                            self.singlePokemon = pokemon as? SinglePokemon
                        }
                    }
            } else {
                if let pokemon = singlePokemon {
                    VStack {
                        AsyncImage(url: URL(string: pokemon.sprites.front_shiny)!,
                                   placeholder: { Image("pokeball") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(width: 250, height: 250)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        List {
                            Text("Name: \(pokemon.forms[0].name.capitalizingFirstLetter())").font(Font.custom("Pokemon Solid", size: 22))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white)
                            Text("Height: \(pokemon.height)").font(Font.custom("Pokemon Solid", size: 22))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white)
                            Text("ID: \(pokemon.id)").font(Font.custom("Pokemon Solid", size: 22))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white)
                        }.listStyle(.insetGrouped)
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: MovesView(singlePokemon: pokemon)) {
                                Text("Moves").font(Font.custom("Pokemon Solid", size: 22))
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                        .buttonStyle(CustomButtonStyle())                    }
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

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView()
//    }
//}

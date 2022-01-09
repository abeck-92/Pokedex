//
//  ContentView.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon: [Results] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("My PokeDex").font(Font.custom("Pokemon Solid", size: 34))
                    
                    if !(pokemon.count == 0) {
                        List(pokemon[0].results) { pokemon in
                            NavigationLink(destination: PokemonView(url: pokemon.url, name: pokemon.name)) {
                                HStack {
                                    Image("pokeball")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Text(pokemon.name.capitalizingFirstLetter()).font(Font.custom("Pokemon Solid", size: 22))
                                }
                            }
                        }
                    } else {
                        Image("pokeball")
                            .onAppear {
                                API().getMovies(url: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=150") { (pokemon) in
                                    self.pokemon = [pokemon] as! [Results]
                                }
                                UITableView.appearance().backgroundColor = .clear
                            }
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//
//  API.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/9/22.
//

import SwiftUI

class API {

    public func getMovies(url: String, completion: @escaping (Any) -> ()) {
        guard let endpoint = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(with: endpoint) { (data, _, error) in
            guard let data = data else {
                return
            }
            let pokemon = try! JSONDecoder().decode(Results.self, from: data)

            DispatchQueue.main.async {
                completion(pokemon)
            }
        }
        .resume()
    }

    public func getPokemon(url: String, completion: @escaping (Any) -> ()) {
        guard let endpoint = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(with: endpoint) { (data, _, error) in
            guard let data = data else {
                return
            }
            let pokemon = try! JSONDecoder().decode(SinglePokemon.self, from: data)

            DispatchQueue.main.async {
                completion(pokemon)
            }
        }
        .resume()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

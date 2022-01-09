//
//  Movies.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/9/22.
//

import Foundation

struct Pokemon: Codable, Identifiable {

    let id = UUID()
    var name: String
    let url: String

}

struct Results: Codable, Identifiable {
    let id = UUID()
    let count: Int
    let next: String
    var results: [Pokemon]
}

struct SinglePokemon: Codable, Identifiable {
    let id: Int
    let height: Int
    let base_experience: Int
    let forms: [Forms]
    let sprites: Sprites
    
}

struct Forms: Codable {
    var name: String
    let url: String
}

struct Sprites: Codable {
    let front_default: String
    let front_shiny: String
}

var testPokemon = Pokemon(name: "test", url: "test.com")
var testResults = Results(count: 1, next: "none.com", results: [testPokemon])
var testForms = Forms(name: "test name", url: "test.com")
var testSinglePokemon = SinglePokemon(id: 1, height: 1, base_experience: 1, forms: [testForms], sprites: testSprites)
var testSprites = Sprites(front_default: "", front_shiny: "")

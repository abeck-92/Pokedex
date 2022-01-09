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
    let moves: [Moves]
    
}

struct Forms: Codable {
    var name: String
    let url: String
}

struct Sprites: Codable {
    let front_default: String
    let front_shiny: String
}

struct Moves: Codable, Identifiable {
    let id = UUID()
    let move: Move
    let version_group_details: [VersionGroupDetails]
}

struct Move: Codable {
    let name: String
    let url: String
}

struct VersionGroupDetails: Codable {
    let level_learned_at: Int
    let move_learn_method: MoveLearnMethod
}

struct MoveLearnMethod: Codable {
    let name: String
    let url: String
}

var testPokemon = Pokemon(name: "test", url: "test.com")
var testResults = Results(count: 1, next: "none.com", results: [testPokemon])
var testForms = Forms(name: "test name", url: "test.com")
var testSinglePokemon = SinglePokemon(id: 1, height: 1, base_experience: 1, forms: [testForms], sprites: testSprites, moves: [testMoves])
var testSprites = Sprites(front_default: "", front_shiny: "")
var testMoveLearnMethod = MoveLearnMethod(name: "", url: "")
var testVersionGroupDetails = VersionGroupDetails(level_learned_at: 1, move_learn_method: testMoveLearnMethod)
var testMove = Move(name: "", url: "")
var testMoves = Moves(move: testMove, version_group_details: [testVersionGroupDetails])

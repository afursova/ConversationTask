//
//  Character.swift
//  ConversationTask
//
//  Created by Александра on 19.07.2024.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

struct CharacterResponse: Codable {
    let results: [Character]
}


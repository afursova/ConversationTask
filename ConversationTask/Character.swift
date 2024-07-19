//
//  Character.swift
//  ConversationTask
//
//  Created by Александра on 19.07.2024.
//

import Foundation

struct Character: Codable {
    let name: String
}

struct CharacterResponse: Codable {
    let results: [Character]
}


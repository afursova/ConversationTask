//
//  APIService.swift
//  ConversationTask
//
//  Created by Александра on 19.07.2024.
//

import Foundation

class APIService {
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let characters = try? JSONDecoder().decode(CharacterResponse.self, from: data)
            completion(characters?.results)
        }.resume()
    }
}

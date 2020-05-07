//
//  CharacterService.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import Foundation
import Combine

class CharactersRequest: APIRequest {
    let method = RequestType.GET
    let url: String = RequestURLs.charactersURL
    var parameters = [String: Any]()

    init(pageNumber: Int) {
        parameters["page"] = "\(pageNumber)"
    }
}

protocol CharactersListServiceProtocol {
    func fetchCharacters(pageNumber: Int) -> AnyPublisher<CharacterInformation, Error>
}

class CharactersService: CharactersListServiceProtocol {
    private let manager: HTTPManager

    init(manager: HTTPManager = APIManager()) {
        self.manager = manager
    }

    func fetchCharacters(pageNumber: Int) -> AnyPublisher<CharacterInformation, Error> {
        let request = CharactersRequest(pageNumber: pageNumber)
        return manager.makeRequest(apiRequest: request).eraseToAnyPublisher()
    }
}


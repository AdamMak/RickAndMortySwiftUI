//
//  APIManager.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import Foundation
import Combine

class APIManager {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<Output: Decodable>(apiRequest: APIRequest) -> AnyPublisher<Output, Error> {
        return session
            .dataTaskPublisher(for: apiRequest.request())
            .mapError { $0 }
            .map { $0.data }
            .decode(type: Output.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


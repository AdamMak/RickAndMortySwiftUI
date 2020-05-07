//
//  HTTPManager.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import Foundation
import Combine

protocol HTTPManager {
    func makeRequest<Output: Decodable>(apiRequest: APIRequest) -> AnyPublisher<Output, Error>
}

extension APIManager: HTTPManager {
    func makeRequest<Output: Decodable>(apiRequest: APIRequest) -> AnyPublisher<Output, Error> {
        return self.request(apiRequest: apiRequest)
    }
}

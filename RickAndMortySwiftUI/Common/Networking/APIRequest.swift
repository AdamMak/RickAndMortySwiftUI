//
//  APIRequest.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import Foundation

enum RequestType: String {
    case GET, POST
}

protocol APIRequest {
    var method: RequestType { get }
    var url: String { get }
    var parameters: [String : Any] { get }

    func request() -> URLRequest
}

extension APIRequest {
    func request() -> URLRequest {
        switch method {
        case .POST:
            return setUpPostRequest()
        case .GET:
            return setUpGetRequest()
        }
    }

    private func setUpPostRequest() -> URLRequest {
        guard let url = URL(string: url) else {
            fatalError("Error creating url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }

    private func setUpGetRequest() -> URLRequest {
        guard var components = URLComponents(string: url) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: $0, value: "\($1)")
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}

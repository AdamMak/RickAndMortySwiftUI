//
//  CharactersViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import Combine
import SwiftUI
import Foundation

final class CharactersViewModel: ObservableObject, MappableViewModel {
    typealias CustomError = Error

    @Published private(set) var characters = [Character]()
    @Published private var pageCount = 1

    private let service: CharactersListServiceProtocol
    private var totalPages = 0
    private var isRequestInProgress = false
    var cancellables = Set<AnyCancellable>()

    private var shouldStartRequest: Bool {
        guard totalPages != 0 && isRequestInProgress == false else { return true }
        return pageCount <= totalPages
    }

    init(service: CharactersListServiceProtocol) {
        self.service = service
    }

    deinit {
        cancellables.removeAll()
    }

    func fetchCharacters() {
        guard shouldStartRequest else {
            return
        }

        let request = service.fetchCharacters(pageNumber: pageCount)
        let publisher = createPropertyPublisher(publisher: request)

        request.handleError(errorCompletion: {  error in
            print(error)
        }).store(in: &cancellables)

        publisher.scan(pageCount, { previousValue, _ -> Int in
            previousValue + 1
        }).assign(to: \.pageCount, on: self)
            .store(in: &cancellables)

        let pages = publisher.mapErase { $0.info.pages }
        bind(pages, to: \.totalPages)

        let newCharacters = publisher.mapErase { $0.results }
        newCharacters.scan(characters, { return $0 + $1 })
            .assign(to: \.characters, on: self)
            .store(in: &cancellables)

        let requestFinished = publisher.mapErase { _ in false }
        bind(requestFinished, to: \.isRequestInProgress)
    }
}

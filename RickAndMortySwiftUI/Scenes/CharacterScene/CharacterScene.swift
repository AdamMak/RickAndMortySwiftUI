//
//  CharacterScene.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI

struct CharactersScene: View {
    @ObservedObject private var viewModel: CharactersViewModel

    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel

        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none

        UINavigationBar.appearance().barTintColor = UIColor(red: 34/255, green: 36/255, blue: 41/255, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isOpaque = false
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().isTranslucent = false
    }

    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: UIScreen.screenWidth, height: 180, alignment: .center)
                List {
                    ForEach(viewModel.characters) { character in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: CharacterInformationScene(character: character)) {
                                CharacterRow(character: character)
                            }
                        }.onAppear {
                            self.listItemAppears(character)
                        }
                    }.listRowBackground(AppColors.backgroundColor)
                }
            }.onAppear(perform: viewModel.fetchCharacters)
                .background(AppColors.backgroundColor)
                 .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}

extension CharactersScene {
    private func listItemAppears<Item: Identifiable>(_ item: Item) {
        if viewModel.characters.isLastItem(item) {
            viewModel.fetchCharacters()
        }
    }
}

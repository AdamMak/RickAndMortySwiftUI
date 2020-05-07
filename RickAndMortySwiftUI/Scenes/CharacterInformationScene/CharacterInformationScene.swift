//
//  CharacterInformationScene.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterInformationScene: View {
    let character: Character
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            URL(string: character.image).map {
                URLImage($0) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .overlay(FadedView(), alignment: .bottomLeading)
                .frame(width: 300.0, height: 300.0)
            }.cornerRadius(20, corners: [.topLeft, .topRight])
                .overlay(CharacterTitleView(character: character), alignment: .bottomLeading)
            CharacterInformationView(character: character)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding().background(AppColors.backgroundColor)
        .edgesIgnoringSafeArea(.bottom)
    }
}

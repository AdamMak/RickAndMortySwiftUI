//
//  CharacterTitleView.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI

struct CharacterTitleView: View {
    let character: Character
    var body: some View {
        VStack(alignment: .leading) {
            Text(character.name).foregroundColor(.white).font(.system(size: 20))
            Text("id: \(character.id)").foregroundColor(Color.white).font(.system(size: 16))
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
    }
}

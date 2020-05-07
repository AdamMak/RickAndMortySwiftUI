//
//  CharacterRow.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterRow: View {
    let character: Character
    var body: some View {
        HStack {
            URL(string: character.image).map {
                URLImage($0) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .frame(width: 100.0, height: 100.0)
            }
            Text(character.name)
                .foregroundColor(.white)
        }
    }
}


//struct CharacterRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterRow()
//    }
//}

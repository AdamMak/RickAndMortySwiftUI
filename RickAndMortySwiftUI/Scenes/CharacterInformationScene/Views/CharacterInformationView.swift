//
//  CharacterInformationView.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI

struct CharacterInformationView: View {
    let character: Character
    var body: some View {
        VStack(alignment: .leading) {
                HStack {
                    Text("Status").foregroundColor(Color.white)
                    Spacer()
                    Text(character.status).foregroundColor(Color.orange)
                }.padding()
                HStack {
                    Text("Species").foregroundColor(Color.white)
                    Spacer()
                    Text(character.species).foregroundColor(Color.orange)
                }.padding()
                HStack {
                    Text("Gender").foregroundColor(Color.white)
                    Spacer()
                    Text(character.gender).foregroundColor(Color.orange)
                }.padding()
                HStack {
                    Text("Origin").foregroundColor(Color.white)
                    Spacer()
                    Text(character.origin.name).foregroundColor(Color.orange)
                }.padding()
                HStack {
                    Text("Location").foregroundColor(Color.white)
                    Spacer()
                    Text(character.location.name)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }.padding()
        }.frame(maxWidth: 300)
        .background(AppColors.darkGrey)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

//
//  FadedView.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import SwiftUI

struct FadedView: View {
    var body: some View {
        EmptyView()
            .background(AppColors.fadedWhite)
            .opacity(0.4)
            .frame(width: 300, height: 60, alignment: .bottomLeading)
    }
}


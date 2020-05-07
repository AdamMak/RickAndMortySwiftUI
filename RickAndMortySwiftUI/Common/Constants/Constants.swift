//
//  Constants.swift
//  RickAndMortySwiftUI
//
//  Created by Adam Makhfoudi on 07/05/2020.
//  Copyright © 2020 Adam Makhfoudi. All rights reserved.
//

import UIKit
import SwiftUI

struct RequestURLs {
    static let charactersURL = "https://rickandmortyapi.com/api/character"
}

struct AppColors {
    static let backgroundColor = Color(red: 34/255, green: 36/255, blue: 41/255)
    static let fadedWhite = Color(red: 104/255, green: 104/255, blue: 104/255)
    static let darkGrey = Color(red: 51/255, green: 51/255, blue: 51/255)
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

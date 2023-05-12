//
//  Color.swift
//  UberUI
//
//  Created by Robotics on 11/5/2023.
//

import SwiftUI

struct ColorTheme {
   let backgroundColor = Color("BackgroundColor")
   let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
   let primaryTextColor = Color("PrimaryTextColor")
   let secondaryTextColor = Color("SecondaryTextColor")
}

extension Color {
    static let theme = ColorTheme()
}

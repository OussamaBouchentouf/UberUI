//
//  UberUIApp.swift
//  UberUI
//
//  Created by Robotics on 9/5/2023.
//

import SwiftUI

@main
struct UberUIApp: App {
    @StateObject var locationSearchViewModel = LocationSearchViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationSearchViewModel)
        }
    }
}

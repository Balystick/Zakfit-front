//
//  ZakFit_frontApp.swift
//  ZakFit_front
//
//  Created by Aurélien on 09/12/2024.
//

import SwiftUI

@main
struct ZakFit_frontApp: App {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}

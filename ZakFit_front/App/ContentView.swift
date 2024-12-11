//
//  ContentView.swift
//  ZakFit_front
//
//  Created by Aurélien on 09/12/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if authViewModel.isAuthenticated {
            TabBarView()
        } else {
            UserAuthView()
        }
    }
}

#Preview {
    ContentView()
}

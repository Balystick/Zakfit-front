//
//  ContentView.swift
//  ZakFit_front
//
//  Created by Aurélien on 09/12/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        if sharedViewModel.isAuthenticated {
            TabBarView()
        } else {
            UserAuthView()
        }
    }
}


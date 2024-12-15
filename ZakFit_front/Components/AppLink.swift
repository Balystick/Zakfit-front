//
//  AppLink.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct AppLink<Destination: View>: View {
    let label: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .foregroundColor(.orange)
        }
    }
}

//AppLink(
//    label: "Modifier un profil",
//    destination: ProfileEditView()
//)

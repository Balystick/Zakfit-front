//
//  AuthViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct AppSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color("customOrange"))
            content
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
        }
    }
}

//AppSection(
//    title: "Informations personnelles") {
//        PersonalInfoView()
//    }

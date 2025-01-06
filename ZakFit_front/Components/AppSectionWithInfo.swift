//
//  AppSectionWithInfo.swift
//  ZakFit_front
//
//  Created by Aurélien on 06/01/2025.
//

import SwiftUI

struct AppSectionWithInfo<Content: View>: View {
    let title: String
    let infoType: String
    let content: Content
    @Binding var showInfoSheet: Bool
    @Binding var showInfoType: String
    
    init(title: String, infoType: String, showInfoSheet: Binding<Bool>, showInfoType: Binding<String>, @ViewBuilder content: () -> Content) {
        self.title = title
        self.infoType = infoType
        self._showInfoSheet = showInfoSheet
        self._showInfoType = showInfoType
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color("customOrange"))
                Button(action: {
                    showInfoType = infoType
                    showInfoSheet = true
                }) {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("customOrange"))
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            
            content
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
        }
    }
}

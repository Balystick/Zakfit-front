//
//  NutrientView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct NutrientView: View {
    let source: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(
                    title: "Détail du nutriment") {
                        NutrientDescView()
                    }
            }
            .padding()
        }
        .foregroundColor(Color(UIColor.darkGray))
    }
}


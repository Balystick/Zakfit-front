//
//  GoalTypesView.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import SwiftUI

struct GoalTypesView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    let goalTypeCategoryName: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(goalTypeCategoryName)
                    .font(.headline)
                    .foregroundColor(Color("customOrange"))
                VStack {
                    ForEach(profileViewModel.goalTypes) { goalType in
                        NavigationLink(destination: GoalAddView(goalType : goalType)) {
                            VStack(alignment: .leading) {
                                Text(goalType.name)
                                    .font(.headline)
                                Text(goalType.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(.plain)
                        if goalType.id != profileViewModel.goalTypes.last?.id {
                            Divider()
                        }
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
            .padding()
        }
    }
}

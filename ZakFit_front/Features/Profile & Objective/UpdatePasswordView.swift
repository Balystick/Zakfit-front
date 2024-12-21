//
//  UpdatePasswordView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct UpdatePasswordView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            AppSection(title: "Mot de passe actuel") {
                UpdatePasswordOldView()
            }
            AppSection(title: "Nouveau mot de passe") {
                UpdatePasswordNewView()
            }
            Button(action: {
                Task {
                    await profileViewModel.updatePassword()
                }
            }) {
                Text("Valider")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("customOrange"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            if let successMessage = profileViewModel.successMessage {
                    Text(successMessage)
                        .foregroundColor(Color("customOrange"))
                        .padding()
                }
            Spacer()
                .alert(item: $profileViewModel.errorAlert) { errorAlert in
                    Alert(
                        title: Text("Erreur"),
                        message: Text(errorAlert.message),
                        dismissButton: .default(Text("OK"), action: {
                            profileViewModel.errorAlert = nil
                        })
                    )
                }
        }
        .padding()
        .onDisappear {
            profileViewModel.oldPassword = ""
            profileViewModel.newPassword = ""
            profileViewModel.confirmNewPassword = ""
            profileViewModel.successMessage = nil
        }
    }
}

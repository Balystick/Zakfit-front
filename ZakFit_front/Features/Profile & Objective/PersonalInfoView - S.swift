//
//  PersonalInfoView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEdit(label: "Prénom", value: $profileViewModel.firstName, unit: "")
            Divider()
            AppFieldWithEdit(label: "Nom", value: $profileViewModel.lastName, unit: "")
            Divider()
            AppFieldWithEdit(label: "Email", value: $profileViewModel.email, unit: "")
            Divider()
            AppFieldWithLink(label: "Mot de passe", value: "Modifier", destination: { EditPasswordView() })
            Divider()
            AppMenu(
                label: "Sexe",
                options: profileViewModel.sexeOptions,
                selectedOption: $profileViewModel.sexe
            )
            Divider()
            AppDatePicker(label: "Date de naissance", date: $profileViewModel.dateOfBirth, components: .date)
            Divider()
            AppFieldWithEdit(label: "Taille", value: $profileViewModel.height, unit: "m")
        }
    }
}

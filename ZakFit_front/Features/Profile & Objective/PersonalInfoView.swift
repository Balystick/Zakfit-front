//
//  PersonalInfoView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEdit(label: "Prénom", value: $viewModel.firstName, unit: "")
            Divider()
            AppFieldWithEdit(label: "Nom", value: $viewModel.lastName, unit: "")
            Divider()
            AppFieldWithEdit(label: "Email", value: $viewModel.email, unit: "")
            Divider()
            AppFieldWithLink(label: "Mot de passe", value: "Modifier", destination: { EditPasswordView() })
            Divider()
            AppMenu(
                label: "Sexe",
                options: viewModel.sexeOptions,
                selectedOption: $viewModel.sexe
            )
            AppDatePicker(label: "Date de naissance", date: $viewModel.dateOfBirth, components: .date)
//            AppField(label: "Taille", value: $viewModel.height != nil ? "\(viewModel.height!) cm" : "Non renseignée")
        }
    }
}

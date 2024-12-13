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
            AppField(label: "Prénom", value: $viewModel.firstName)
            AppField(label: "Nom", value: $viewModel.lastName)
            AppField(label: "Email", value: $viewModel.email)
            AppField(label: "Sexe", value: $viewModel.gender)
            AppDatePicker(label: "Date de naissance", date: $viewModel.dateOfBirth)
//            AppField(label: "Taille", value: $viewModel.height != nil ? "\(viewModel.height!) cm" : "Non renseignée")
        }
    }
}

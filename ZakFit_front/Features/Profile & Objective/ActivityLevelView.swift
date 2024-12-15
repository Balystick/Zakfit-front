//
//  ActivityLevelView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ActivityLevelView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
            AppPicker(
                label: "Niveau d'activité",
                options: viewModel.activityOptions,
                selection: $viewModel.activityLevel
            )
    }
}

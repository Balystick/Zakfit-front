//
//  NotificationsView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Toggle("Activer les rappels", isOn: $viewModel.isReminderEnabled)
                .fontWeight(.medium)
            Divider()
            AppMenu(
                label: "Type de rappels",
                options: viewModel.recurrenceOptions,
                selectedOption: $viewModel.selectedRecurrence
            )
        }
    }
}

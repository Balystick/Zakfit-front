//
//  NotificationsView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Toggle("Activer les rappels", isOn: $profileViewModel.isReminderEnabled)
                .fontWeight(.medium)
            Divider()
            AppMenu(
                label: "Type de rappels",
                options: profileViewModel.recurrenceOptions,
                selectedOption: $profileViewModel.selectedRecurrence
            )
        }
    }
}

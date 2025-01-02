//
//  ActivityDateTimeView.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

struct ActivityDateTimeView: View {
    @EnvironmentObject var activitiyTrackingViewModel: ActivityTrackingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Date de l'activité")
//            AppDatePicker(
//                label: "Date de l'activité",
//                dateString: $profileViewModel.user.dateOfBirth,
//                components: .date,
//                onValueChanged: {
//                    await profileViewModel.saveUserChanges()
//                }
//            )
        }
    }
}

#Preview {
    ActivityDateTimeView()
}

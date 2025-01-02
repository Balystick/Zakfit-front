//
//  ActivityPeriodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

struct ActivityPeriodView: View {
    @EnvironmentObject var activityTrackingViewModel: ActivityTrackingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppSegmentedPicker(
                options: activityTrackingViewModel.activityPeriodOptions,
                selection: $activityTrackingViewModel.activityPeriod
//                onValueChanged: {
//                    await activityTrackingViewModel.fetchActivitiesByPeriod()
//                }
            )
        }
        
    }
}

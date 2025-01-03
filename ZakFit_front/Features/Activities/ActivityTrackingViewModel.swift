//
//  ActivityTrackingViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

class ActivityTrackingViewModel: ObservableObject {
    private let sharedViewModel: SharedViewModel

    @Published var activityPeriodOptions: [String] = ["7 jours", "Mois", "Année"]
    @Published var activityPeriod: String = "7 jours"
    
    func fetchActivitiesByPeriod() {}
    
    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
    }
}


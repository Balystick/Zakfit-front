//
//  TabBarView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

enum Tab: String {
    case dashboard = "chart.bar.fill"
    case mealTracking = "fork.knife"
    case activityTracking = "figure.run"
    case profile = "person.fill"
}

struct TabBarView: View {
    @State private var selectedTab: Tab = .dashboard

    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Image(systemName: Tab.dashboard.rawValue)
                    Text("Tableau de bord")
                }
                .tag(Tab.dashboard)
            
            Text("Meal")
                .tabItem {
                    Image(systemName: Tab.mealTracking.rawValue)
                    Text("Repas")
                }
                .tag(Tab.mealTracking)
            
            Text("Activity")
                .tabItem {
                    Image(systemName: Tab.activityTracking.rawValue)
                    Text("Activités")
                }
                .tag(Tab.activityTracking)
            
            ProfileView()
                .tabItem {
                    Image(systemName: Tab.profile.rawValue)
                    Text("Profil")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    TabBarView()
}

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
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                DashboardView()
                    .tabItem {
                        Image(systemName: Tab.dashboard.rawValue)
                        Text("Tableau de bord")
                    }
                    .tag(Tab.dashboard)
                
                MealTrackingView()
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
            VStack(spacing: 0) {
                if selectedTab == .mealTracking {
                    Divider()
                        .background(Color(UIColor.systemGray5))
                    VStack {
                        HStack {
                            Text("Calories consommées :")
                                .fontWeight(.medium)
                            Text("1500")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 4000 kcal")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Glucides :")
                                .fontWeight(.medium)
                            Text("2500")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                            Text("/ 1000 g")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Lipides :")
                                .fontWeight(.medium)
                            Text("1500")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 3000 g")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Protéines :")
                                .fontWeight(.medium)
                            Text("36")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 100 g")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("AG monoinsaturés :")
                                .fontWeight(.medium)
                            Text("1,3")
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                            Text("/ 3 mg")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .padding(.bottom, 15)
                    .foregroundColor(Color(UIColor.darkGray))
                    .background(Color(UIColor.systemGray6))
                    Color.clear.frame(height: 45)
                } else {
                    VStack(spacing: 0) {
                        Divider()
                            .background(Color(UIColor.systemGray5))
                        Color(UIColor.systemGray6)
                            .frame(height: 15)
                        Color.clear.frame(height: 45)
                    }
                }
            }
        }
    }
}


#Preview {
    TabBarView()
}

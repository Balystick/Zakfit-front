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
    @EnvironmentObject var authViewModel: AuthViewModel
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
                    .environmentObject(ProfileViewModel(authViewModel: authViewModel))
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
                                .font(.callout)
                            Text("1500")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 4000 kcal")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Glucides :")
                                .font(.callout)
                            Text("2500")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                            Text("/ 1000 g")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Lipides :")
                                .font(.callout)
                            Text("1500")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 3000 g")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Protéines :")
                                .font(.callout)
                            Text("36")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                            Text("/ 100 g")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("AG monoinsaturés :")
                                .font(.callout)
                            Text("1,3")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                            Text("/ 3 mg")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .padding(.bottom, 15)
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
        .foregroundColor(Color(UIColor.darkGray))
//        .tint(Color("customOrange"))
    }
}


#Preview {
    TabBarView()
}

//
//  ZakFit_frontApp.swift
//  ZakFit_front
//
//  Created by Aurélien on 09/12/2024.
//

import SwiftUI

@main
struct ZakFit_frontApp: App {
    @StateObject private var sharedViewModel = SharedViewModel()
    @StateObject private var userAuthViewModel: UserAuthViewModel
    @StateObject private var dashboardViewModel: DashboardViewModel
    @StateObject private var mealTrackingViewModel: MealTrackingViewModel
    @StateObject private var activityTrackingViewModel: ActivityTrackingViewModel
    @StateObject private var profileViewModel: ProfileViewModel

    init() {
        let sharedModel = SharedViewModel()
        _sharedViewModel = StateObject(wrappedValue: sharedModel)
        _userAuthViewModel = StateObject(wrappedValue: UserAuthViewModel(sharedViewModel: sharedModel))
        _dashboardViewModel = StateObject(wrappedValue: DashboardViewModel(sharedViewModel: sharedModel))
        _mealTrackingViewModel = StateObject(wrappedValue: MealTrackingViewModel(sharedViewModel: sharedModel))
        _activityTrackingViewModel = StateObject(wrappedValue: ActivityTrackingViewModel(sharedViewModel: sharedModel))
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(sharedViewModel: sharedModel))
        // Navigation
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]
        navigationAppearance.backgroundColor = UIColor.white
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        // TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "customOrange")
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "customOrange") ?? UIColor.orange]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.darkGray
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        tabBarAppearance.backgroundColor = UIColor.systemGray6
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        // SegmentedPicker
        let segmentedPickerAppearance = UISegmentedControl.appearance()
        segmentedPickerAppearance.selectedSegmentTintColor = UIColor(named: "customOrange")
        segmentedPickerAppearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedPickerAppearance.setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        // DatePicker
        UIDatePicker.appearance().tintColor = UIColor(named: "customOrange")
        // Toggle
        UISwitch.appearance().onTintColor = UIColor(named: "customOrange")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedViewModel)
                .environmentObject(userAuthViewModel)
                .environmentObject(dashboardViewModel)
                .environmentObject(mealTrackingViewModel)
                .environmentObject(activityTrackingViewModel)
                .environmentObject(profileViewModel)
        }
    }
}

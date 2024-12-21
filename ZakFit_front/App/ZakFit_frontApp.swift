//
//  ZakFit_frontApp.swift
//  ZakFit_front
//
//  Created by Aurélien on 09/12/2024.
//

import SwiftUI

@main
struct ZakFit_frontApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    init() {
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
        let appearancePicker = UISegmentedControl.appearance()
        appearancePicker.selectedSegmentTintColor = UIColor(named: "customOrange")
        appearancePicker.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        appearancePicker.setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        // DatePicker
        UIDatePicker.appearance().tintColor = UIColor(named: "customOrange")
        // Toggle
        UISwitch.appearance().onTintColor = UIColor(named: "customOrange")
        // NavigationTitle
        let NavTitleAppearance = UINavigationBarAppearance()
        NavTitleAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        NavTitleAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]
        NavTitleAppearance.backgroundColor = UIColor.white
        UINavigationBar.appearance().standardAppearance = NavTitleAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = NavTitleAppearance
        UINavigationBar.appearance().compactAppearance = NavTitleAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}

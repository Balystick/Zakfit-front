//
//  DashboardView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Text(authViewModel.currentUser!.email)
    }
}

#Preview {
    DashboardView()
}

//
//  AuthViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

class AuthViewModel: ObservableObject, @unchecked Sendable {
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?

    func login(user: User) {
        self.isAuthenticated = true
        self.currentUser = user
    }

    func logout() {
        self.isAuthenticated = false
        self.currentUser = nil
    }
}

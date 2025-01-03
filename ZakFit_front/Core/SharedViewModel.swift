//
//  SharedViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

class SharedViewModel: ObservableObject, @unchecked Sendable {
    @Published var isAuthenticated: Bool = false
    @Published var user: User = User()
    @Published var lastUserWeight: UserWeight = UserWeight()
}

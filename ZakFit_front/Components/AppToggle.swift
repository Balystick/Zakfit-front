//
//  AppToggle.swift
//  ZakFit_front
//
//  Created by Aurélien on 21/12/2024.
//

import SwiftUI

struct AppToggle: View {
    let label: String
    @Binding var isOn: Bool
    let onValueChanged: (() async -> Void)?

    init(label: String, isOn: Binding<Bool>, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._isOn = isOn
        self.onValueChanged = onValueChanged
    }

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)

            Spacer()

            Toggle("", isOn: $isOn)
                .tint(Color("customOrange"))
                .onChange(of: isOn) {
                    if let onValueChanged = onValueChanged {
                        Task {
                            await onValueChanged()
                        }
                    }
                }
        }
        .padding(.vertical, 5)
    }
}
//AppToggle(
//    label: "Activer les rappels",
//    isOn: $profileViewModel.isReminderEnabled,
//    onValueChanged: {
//        await performAsyncAction()
//    }
//)

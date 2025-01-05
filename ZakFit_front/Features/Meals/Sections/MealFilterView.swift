//
//  MealFilterView.swift
//  ZakFit_front
//
//  Created by Aurélien on 05/01/2025.
//

import SwiftUI

struct MealFilterView: View {
    @State var dateString: String

    init() {
        let formatter = ISO8601DateFormatter()
        dateString = formatter.string(from: Date())
    }
    
    var body: some View {
        AppDatePicker(
            label: "Date de la période",
            dateString: $dateString,
            components: .date
        )
    }
}

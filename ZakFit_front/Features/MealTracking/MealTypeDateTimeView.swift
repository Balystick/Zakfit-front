//
//  MealTypeDateTimeView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealTypeDateTimeView: View {
    @State private var selectedDate: Date? = nil
    @State private var selectedTime: Date? = nil
    @State private var food: Double = 75.0
    @State private var selectedOption = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AppMenu(label: "Type du repas", options: options, selectedOption: $selectedOption)
                Divider()
                AppDatePicker(
                    label: "Date du repas",
                    date: $selectedDate,
                    components: .date
                )
                Divider()
                AppDatePicker(
                    label: "Heure du repas",
                    date: $selectedTime,
                    components: .hourAndMinute
                )
            }
        }
        .foregroundColor(Color(UIColor.darkGray))
    }
}

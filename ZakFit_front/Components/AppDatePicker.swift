//
//  AppDatePicker.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppDatePicker: View {
    let label: String
    @Binding var date: Date?
    let components: DatePickerComponents

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            DatePicker(
                "",
                selection: Binding(
                    get: { date ?? Date() },
                    set: { date = $0 }
                ),
                displayedComponents: components
            )
            .labelsHidden()
            .tint(Color("customOrange"))
        }
        .padding(.vertical, 5)
    }
}

//AppDatePicker(
//    label: "Select Date",
//    date: $selectedDate,
//    components: .date
//)

//AppDatePicker(
//    label: "Select Time",
//    date: $selectedTime,
//    components: .hourAndMinute
//)



//
//  AppFieldWithDestination.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppFieldWithPush<T: LosslessStringConvertible, Destination: View>: View {
    let label: String
    @Binding var value: T
    let unit: String?
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(label)
                    .fontWeight(.medium)
                
                Spacer()

                HStack {
                    Text("\(value)")
                    if let unit = unit {
                        Text(unit)
                    }
                }

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}

//AppFieldWithPush(
//    label: "",
//    value: ,
//    unit: "",
//    destination: { label in
//        WeightEditView(label: label, )
//    }
//)


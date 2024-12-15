//
//  AppFieldWithDestination.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppFieldWithPush<T: LosslessStringConvertible, Destination: View>: View {
    let label: String
    let value: T
    let unit: String?
    let destination: (String) -> Destination

    var body: some View {
        NavigationLink(destination: destination(label)) {
            HStack {
                Text(label)
                    .fontWeight(.medium)
                    .foregroundColor(Color(UIColor.darkGray))
                
                Spacer()

                HStack {
                    Text("\(value)")
                        .foregroundColor(.gray)

                    if let unit = unit {
                        Text(unit)
                            .foregroundColor(.gray)
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


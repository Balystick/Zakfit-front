//
//  EnergyDataView.swift
//  ZakFit_front
//
//  Created by Aurélien on 06/01/2025.
//

import SwiftUI

struct EnergyDataView: View {
    
    var body: some View {
        HStack {
            Spacer()
            EnergyConsumedView()
            Spacer(minLength: 35)
            EnergyBurnedView()
            Spacer()
        }
    }
}


//
//  ActivityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealListView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        HStack {
                            Text("05/01/24 07:15")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Petit-déjeuner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 410 kcal")
                                    .font(.callout)
                                Text("Protéine : 15 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 18 g")
                                    .font(.callout)
                                Text("Glucides : 35 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("05/01/24 10:00")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Collation")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 160 kcal")
                                    .font(.callout)
                                Text("Protéine : 5 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 7 g")
                                    .font(.callout)
                                Text("Glucides : 20 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("05/01/24 12:30")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Déjeuner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 720 kcal")
                                    .font(.callout)
                                Text("Protéine : 30 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 24 g")
                                    .font(.callout)
                                Text("Glucides : 75 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("05/01/24 19:00")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Dîner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 600 kcal")
                                    .font(.callout)
                                Text("Protéine : 25 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 22 g")
                                    .font(.callout)
                                Text("Glucides : 50 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("04/01/24 07:20")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Petit-déjeuner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 390 kcal")
                                    .font(.callout)
                                Text("Protéine : 12 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 20 g")
                                    .font(.callout)
                                Text("Glucides : 30 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("04/01/24 15:30")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Collation")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 170 kcal")
                                    .font(.callout)
                                Text("Protéine : 6 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 8 g")
                                    .font(.callout)
                                Text("Glucides : 15 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("04/01/24 12:45")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Déjeuner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 680 kcal")
                                    .font(.callout)
                                Text("Protéine : 28 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 22 g")
                                    .font(.callout)
                                Text("Glucides : 70 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()

                HStack {
                    VStack {
                        HStack {
                            Text("04/01/24 19:15")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Dîner")
                                .fontWeight(.medium)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Énergie : 570 kcal")
                                    .font(.callout)
                                Text("Protéine : 22 g")
                                    .font(.callout)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Lipides : 19 g")
                                    .font(.callout)
                                Text("Glucides : 48 g")
                                    .font(.callout)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


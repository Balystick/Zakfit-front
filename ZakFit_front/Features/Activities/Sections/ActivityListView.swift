//
//  ActivityListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 05/01/2025.
//

import SwiftUI

struct ActivityListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("05/01/24 06:10")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Course à pied")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 40 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 395 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("04/01/24 06:30")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Cyclisme")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 50 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 450 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("02/01/24 06:15")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Course à pied")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 35 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 345 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("01/01/24 06:20")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Yoga")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 60 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 180 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("30/12/23 06:12")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Course à pied")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 45 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 420 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("29/12/23 06:10")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Natation")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 40 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 350 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("27/12/23 06:10")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Course à pied")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 30 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 310 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("26/12/23 06:30")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Randonnée")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 60 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 280 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("24/12/23 06:12")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Course à pied")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 45 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 420 kcal")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("23/12/23 06:30")
                                .fontWeight(.medium)
                            Spacer()
                            Text("Fitness")
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text("Durée : 30 min")
                                .font(.callout)
                            Spacer()
                            Text("Énergie : 200 kcal")
                                .font(.callout)
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

#Preview {
    ActivityListView()
}

//
//  ActivityListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

struct ActivityListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationLink(destination: ActivityAddView()) {
                HStack {
                    Text("Ajouter une activité")
                        .fontWeight(.medium)
                        .foregroundColor(Color("customOrange"))
                }
                .padding(.vertical, 12)
            }
            Divider()
                HStack {
                    NavigationLink(destination: ActivityDescView()) {
                        
                        Text("29/12/24 06:14")
                            .fontWeight(.medium)
                        Spacer()
                        Text("Course à pied")
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("29/12/24 19:14")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Fitness")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("28/12/24 06:10")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Course à pied")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("27/12/24 06:03")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Course à pied")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("26/12/24 06:11")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Course à pied")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("26/12/24 19:17")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Fitness")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("25/12/24 06:04")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Course à pied")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
                Divider()
                HStack {
                    Text("24/12/24 06:17")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Course à pied")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.vertical, 12)
            }
        }
    }

    
    #Preview {
        ActivityListView()
    }

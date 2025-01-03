//
//  UserAuthView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct UserAuthView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var bounceEffect = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.zakfit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .scaleEffect(bounceEffect ? 1.0 : 0.5)
                    .offset(y: bounceEffect ? 0 : -200)
                    .animation(
                        Animation.interpolatingSpring(stiffness: 100, damping: 10)
                            .delay(0.3),
                        value: bounceEffect
                    )
                    .onAppear {
                        bounceEffect = true
                    }
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.darkGray))
                        TextField("Entrer votre email", text: $userAuthViewModel.email)
                            .foregroundColor(Color(.darkGray))
                            .padding(13)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.darkGray), lineWidth: 1)
                            }
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Mot de passe")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.darkGray))
                        SecureField("Entrer votre mot de passe", text: $userAuthViewModel.password)
                            .padding(13)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.darkGray), lineWidth: 1)
                            }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack {
                    Button {
                        Task {
                            await userAuthViewModel.registration()
                        }
                    } label: {
                        Text("S'inscrire")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.darkGray))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.leading, 20)
                            .layoutPriority(1)
                    }
                    
                    Spacer()
                        .frame(width: 20)
                
                    Button {
                        Task {
                            await userAuthViewModel.login()
                        }
                    } label: {
                        Text("Se connecter")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("customOrange"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing, 20)
                            .layoutPriority(1)
                    }
                }
                                
                .alert(item: $userAuthViewModel.errorAlert) { errorAlert in
                    Alert(
                        title: Text("Erreur"),
                        message: Text(errorAlert.message),
                        dismissButton: .default(Text("OK"), action: {
                            userAuthViewModel.errorAlert = nil
                        })
                    )
                }
                Spacer()
            }
            .onAppear {
                sharedViewModel.user = User()
            }
        }
    }
}


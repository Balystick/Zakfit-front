//
//  UserAuthView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct UserAuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject var viewModel = UserAuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.zakfit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .fontWeight(.semibold)
                        TextField("Entrer votre email", text: $viewModel.email)
                            .padding(10)
                            .frame(width: 300)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1)
                            }
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Mot de passe")
                            .fontWeight(.semibold)
                        SecureField("Entrer votre mot de passe", text: $viewModel.password)
                            .padding(10)
                            .frame(width: 300)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1)
                            }
                    }
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                HStack {
                    Button {
                        Task {
                            await viewModel.registration(authViewModel: authViewModel)
                        }
                    } label: {
                        Text("S'inscrire")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.horizontal)
                            .layoutPriority(1)
                    }
                    
                    Button {
                        Task {
                            await viewModel.login(authViewModel: authViewModel)
                        }
                    } label: {
                        Text("Se connecter")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.horizontal)
                            .layoutPriority(1)
                    }
                }
                
                Spacer()
                
                .alert(item: $viewModel.errorAlert) { errorAlert in
                    Alert(
                        title: Text("Erreur"),
                        message: Text(errorAlert.message),
                        dismissButton: .default(Text("OK"), action: {
                            viewModel.errorAlert = nil
                        })
                    )
                }
                Spacer()
            }
        }
    }
}

#Preview {
    UserAuthView()
}

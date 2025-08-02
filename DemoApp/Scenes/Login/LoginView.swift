//
//  LoginView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        BaseView(builderContent: {
            VStack(alignment: .center, spacing: 20) {
                Text("Login")
                    .foregroundStyle(.black)
                    .font(.system(size: 25, weight: .bold))
                
                VStack(alignment: .leading, spacing: 4) {
                    TextField("Email",
                              text: $viewModel.email,
                              onEditingChanged: { editing in
                        if !editing {
                            viewModel.verifyEmail()
                        }
                    })
                    .padding(10)
                    .background(viewModel.emailError.isEmpty ? Color.gray.opacity(0.2) : Color.red.opacity(0.2))
                    .cornerRadius(10)
                    
                    if !viewModel.emailError.isEmpty {
                        Text(viewModel.emailError)
                            .foregroundColor(.red)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    SecureField("Password", text: $viewModel.password)
                        .padding(10)
                        .background(viewModel.passwordError.isEmpty ? Color.gray.opacity(0.2) : Color.red.opacity(0.2))
                        .cornerRadius(10)
                        .onChange(of: viewModel.password) { _ in
                            viewModel.verifyPassword()
                        }
                    
                    if !viewModel.passwordError.isEmpty {
                        Text(viewModel.passwordError)
                            .foregroundColor(.red)
                    }
                }
                
                Button {
                    viewModel.verifyEmail()
                    viewModel.verifyPassword()
                    if viewModel.isFormValid {
                        viewModel.login()
                    }
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    } else {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(viewModel.isFormValid ? Color.blue : Color.gray.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .disabled(!viewModel.isFormValid)
                
                Button {
                    viewModel.showRegister()
                } label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                        .foregroundColor(.blue)
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.alertTitle),
                      message: Text(viewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        })
    }
}

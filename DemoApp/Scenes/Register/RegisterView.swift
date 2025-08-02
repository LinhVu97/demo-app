//
//  RegisterView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        BaseView(builderContent: {
            VStack(alignment: .center, spacing: 20) {
                Text("Register")
                    .foregroundStyle(.black)
                    .font(.system(size: 25, weight: .bold))
                
                TextField("Username",
                          text: $viewModel.username)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
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
                        viewModel.register()
                    }
                } label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(viewModel.isFormValid ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!viewModel.isFormValid)
            }
            .alert(isPresented: $viewModel.showSuccessAlert) {
                Alert(title: Text("Success"),
                      message: Text("Register success"),
                      dismissButton: .default(Text("OK")) {
                    viewModel.dismissScreen()
                })
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        })
    }
}

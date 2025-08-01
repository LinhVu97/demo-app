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
                
                TextField("Email", text: $viewModel.email)
                    .padding(10)
                    .textContentType(.emailAddress)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                SecureField("Password", text: $viewModel.password)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    viewModel.login()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.showRegister()
                } label: {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                        .foregroundColor(.blue)
                }
            }
        })
    }
}

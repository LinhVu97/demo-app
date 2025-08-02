//
//  ProfileView.swift
//  DemoApp
//
//  Created by Linh Vu on 2/8/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        BaseView(builderContent: {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button {
                        viewModel.dismissScreen()
                    } label: {
                        Text("← Back")
                            .foregroundStyle(.blue)
                    }
                    
                    Spacer()
                    
                    Text("Profile")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Username:")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    Text(viewModel.user.username)
                        .font(.title2)
                        .foregroundStyle(.black)
                    
                    Text("Email:")
                        .font(.headline)
                        .foregroundStyle(.gray)
                    Text(viewModel.user.email)
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                
                Spacer()
            }
            .padding()
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

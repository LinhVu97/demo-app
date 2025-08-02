//
//  HomeView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(builderContent: {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.logout()
                    } label: {
                        Text("Logout")
                            .foregroundStyle(.red)
                            .bold()
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.listUser) { user in
                            Text(user.username)
                                .onTapGesture {
                                    viewModel.showProfile(user)
                                }
                        }
                        .padding(.vertical, 20)
                    }
                }
                .onAppear {
                    viewModel.loadListUser()
                }
            }
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

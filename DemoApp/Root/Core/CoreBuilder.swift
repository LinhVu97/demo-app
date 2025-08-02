//
//  CoreBuilder.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    func build(isLoggedIn: Binding<Bool>) -> AnyView {
        core(isLoggedIn: isLoggedIn).any()
    }
    
    func core(isLoggedIn: Binding<Bool>) -> some View {
        RouterView { router in
            if isLoggedIn.wrappedValue {
                return AnyView(homeView(router: router))
            } else {
                return AnyView(loginView(router: router))
            }
        }
    }
    
    func loginView(router: AnyRouter) -> some View {
        let viewModel = LoginViewModel(router: CoreRouter(router: router,
                                                          builder: self))
        return LoginView(viewModel: viewModel)
    }
    
    func registerView(router: AnyRouter) -> some View {
        let viewModel = RegisterViewModel(router: CoreRouter(router: router,
                                                             builder: self))
        return RegisterView(viewModel: viewModel)
    }
    
    func homeView(router: AnyRouter) -> some View {
        let viewModel = HomeViewModel(router: CoreRouter(router: router,
                                                         builder: self))
        return HomeView(viewModel: viewModel)
    }
    
    func profileView(router: AnyRouter, user: UserModel) -> some View {
        let viewModel = ProfileViewModel(router: CoreRouter(router: router,
                                                            builder: self),
                                         user: user)
        return ProfileView(viewModel: viewModel)
    }
}

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
    func build() -> AnyView {
        core().any()
    }
    
    func core() -> some View {
        RouterView { router in
            let loginViewModel = LoginViewModel(router: CoreRouter(router: router,
                                                                   builder: self))
            
            return LoginView(viewModel: loginViewModel)
        }
    }
    
//    func loginView() -> some View {
//        return EmptyView()
//    }
    
    func registerView(router: AnyRouter) -> some View {
        let viewModel = RegisterViewModel(router: CoreRouter(router: router,
                                                             builder: self))
        return RegisterView(viewModel: viewModel)
    }
}

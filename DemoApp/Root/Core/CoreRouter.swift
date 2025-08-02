//
//  CoreRouter.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftfulRouting

typealias AnyRouter = SwiftfulRouting.AnyRouter
typealias RouterView = SwiftfulRouting.RouterView

@MainActor
struct CoreRouter {
    let router: AnyRouter
    let builder: CoreBuilder
    
    func dismissScreen() {
        router.dismissScreen()
    }
    
    func showLoginView() {
        router.showScreen(.push) { router in
            builder.loginView(router: router)
        }
    }
    
    func showRegisterView() {
        router.showScreen(.push) { router in
            builder.registerView(router: router)
        }
    }
    
    func showHomeView() {
        router.showScreen(.push) { router in
            builder.homeView(router: router)
        }
    }
    
    func showProfileView(user: UserModel) {
        router.showScreen(.push) { router in
            builder.profileView(router: router, user: user)
        }
    }
}

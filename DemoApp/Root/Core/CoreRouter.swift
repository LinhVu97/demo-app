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
        
    }
    
    func showRegisterView() {
        router.showScreen(.push) { router in
            builder.registerView(router: router)
        }
    }
}

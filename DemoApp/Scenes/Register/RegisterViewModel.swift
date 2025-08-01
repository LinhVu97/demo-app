//
//  RegisterViewModel.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

class RegisterViewModel: ObservableObject {
    private let router: RegisterRouter
    
    init(router: RegisterRouter) {
        self.router = router
    }
    
    func dismissScreen() {
        router.dismissScreen()
    }
}

//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let router: LoginRouter
    
    init(router: LoginRouter) {
        self.router = router
    }
    
    func login() {
        print("Login")
    }
    
    func showRegister() {
        router.showRegisterView()
    }
}

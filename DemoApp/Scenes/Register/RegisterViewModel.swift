//
//  RegisterViewModel.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

class RegisterViewModel: ObservableObject {
    private let router: RegisterRouter
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var showSuccessAlert: Bool = false
    
    var isFormValid: Bool {
        return emailError.isEmpty &&
               passwordError.isEmpty &&
               !username.trimmingCharacters(in: .whitespaces).isEmpty &&
               !email.trimmingCharacters(in: .whitespaces).isEmpty &&
               !password.isEmpty
    }
    
    init(router: RegisterRouter) {
        self.router = router
    }
    
    func dismissScreen() {
        router.dismissScreen()
    }
    
    func register() {
        let user = UserModel(username: username,
                             email: email,
                             password: password)
        print("User Register: \(user)")
        AccountStore.addUser(user)
        
        showSuccessAlert = true
    }
    
    func verifyEmail() {
        if !self.email.isValidEmail() {
            self.emailError = "Email invalid"
        } else {
            self.emailError = ""
        }
    }
    
    func verifyPassword() {
        if self.password.count < 6 {
            self.passwordError = "Password must be at least 6 characters"
        } else {
            self.passwordError = ""
        }
    }
}

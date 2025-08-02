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
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var isLoading: Bool = false
    
    var isFormValid: Bool {
        return !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.isEmpty
    }
    
    private let router: LoginRouter
    
    init(router: LoginRouter) {
        self.router = router
    }
    
    func login() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            
            let users = AccountStore.loadUsers()
            
            if let user = users.first(where: { $0.email == self.email && $0.password == self.password }) {
                AccountStore.saveCurrentUser(user)
                
                NotificationCenter.default.post(name: .didLogin, object: nil)
                
                self.alertTitle = "Success"
                self.alertMessage = "Login successful"
                self.showAlert = true
                self.isLoading = false
            } else {
                self.alertTitle = "Error"
                self.alertMessage = "Invalid email or password"
                self.isLoading = false
                self.showAlert = true
            }
        }
    }
    
    func showRegister() {
        router.showRegisterView()
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

//
//  HomeViewModel.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    private var router: HomeRouter
    
    @Published var listUser: [UserModel] = []
    
    init(router: HomeRouter) {
        self.router = router
    }
    
    func loadListUser() {
        listUser = AccountStore.loadUsers()
    }
    
    func logout() {
        AccountStore.clearCurrentUser()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            NotificationCenter.default.post(name: .didLogout, object: nil)
        }
    }
    
    func showProfile(_ user: UserModel) {
        router.showProfileView(user: user)
    }
}

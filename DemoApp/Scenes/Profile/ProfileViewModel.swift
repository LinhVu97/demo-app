//
//  ProfileViewModel.swift
//  DemoApp
//
//  Created by Linh Vu on 2/8/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let router: ProfileRouter
    @Published var user: UserModel
    
    init(router: ProfileRouter, user: UserModel) {
        self.router = router
        self.user = user
    }
    
    func dismissScreen() {
        router.dismissScreen()
    }
}

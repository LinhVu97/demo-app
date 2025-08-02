//
//  HomeRouter.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

protocol HomeRouter {
    func showProfileView(user: UserModel)
}

extension CoreRouter: HomeRouter {}

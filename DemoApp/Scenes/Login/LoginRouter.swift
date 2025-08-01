//
//  LoginRouter.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

protocol LoginRouter {
    func showRegisterView()
}

extension CoreRouter: LoginRouter {}

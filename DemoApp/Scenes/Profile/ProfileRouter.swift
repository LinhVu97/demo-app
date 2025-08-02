//
//  ProfileRouter.swift
//  DemoApp
//
//  Created by Linh Vu on 2/8/25.
//

import Foundation

protocol ProfileRouter {
    func dismissScreen()
}

extension CoreRouter: ProfileRouter {}

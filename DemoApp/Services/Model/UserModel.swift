//
//  UserModel.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

struct UserModel: Codable, Equatable, Identifiable {
    var id: String { email }
    let username: String
    let email: String
    let password: String
}

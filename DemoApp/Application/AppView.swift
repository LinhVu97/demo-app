//
//  AppView.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftUI

struct AppView: View {
    @State private var isLoggedIn = AccountStore.getCurrentUser() != nil
    
    var body: some View {
        let builder = CoreBuilder()
        return builder.build(isLoggedIn: $isLoggedIn)
            .onReceive(NotificationCenter.default.publisher(for: .didLogin)) { _ in
                isLoggedIn = true
            }
            .onReceive(NotificationCenter.default.publisher(for: .didLogout)) { _ in
                isLoggedIn = false
            }
    }
}

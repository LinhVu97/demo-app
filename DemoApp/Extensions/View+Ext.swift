//
//  View+Ext.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftUI

extension View {
    func any() -> AnyView {
        AnyView(self)
    }
}

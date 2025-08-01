//
//  Builder.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftUI

@MainActor
protocol Builder {
    func build() -> AnyView
}

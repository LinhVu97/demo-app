//
//  UIApplication+Ext.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    var safeArea: UIEdgeInsets {
        let keyWindow = connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .first(where: { $0.isKeyWindow })
        return keyWindow?.safeAreaInsets ?? .zero
    }
}

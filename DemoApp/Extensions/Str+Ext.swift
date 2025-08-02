//
//  Str+Ext.swift
//  DemoApp
//
//  Created by Linh Vu on 1/8/25.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: self)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isEmptyOrWhiteSpace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// MARK: - Notification
extension Notification.Name {
    static let didLogin = Notification.Name("didLogin")
    static let didLogout = Notification.Name("didLogout")
}

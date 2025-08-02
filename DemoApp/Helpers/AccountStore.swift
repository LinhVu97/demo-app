//
//  AccountStore.swift
//  DemoApp
//
//  Created by Linh Vu on 2/8/25.
//

import Foundation

// MARK: - Save User
enum AccountStore {
    private static let key = "saved_users"
    private static let currentUserKey = "current_user"
    
    static func saveUser(_ users: [UserModel]) {
        do {
            let data = try JSONEncoder().encode(users)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    static func loadUsers() -> [UserModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            let users = try JSONDecoder().decode([UserModel].self, from: data)
            return users
        } catch {
            print(error)
            return []
        }
    }
    
    static func addUser(_ user: UserModel) {
        var users = loadUsers()
        
        if users.contains(where: { $0.email.lowercased() == user.email.lowercased() }) {
            print("User already exists")
            return
        }
        
        users.append(user)
        saveUser(users)
    }
    
    static func clearAll() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

// MARK: - Current User
extension AccountStore {
    static func saveCurrentUser(_ user: UserModel) {
            do {
                let data = try JSONEncoder().encode(user)
                UserDefaults.standard.set(data, forKey: currentUserKey)
            } catch {
                print(error)
            }
        }
        
        static func getCurrentUser() -> UserModel? {
            guard let data = UserDefaults.standard.data(forKey: currentUserKey) else {
                return nil
            }
            
            do {
                let user = try JSONDecoder().decode(UserModel.self, from: data)
                return user
            } catch {
                print(error)
                return nil
            }
        }
        
        static func clearCurrentUser() {
            UserDefaults.standard.removeObject(forKey: currentUserKey)
        }
}

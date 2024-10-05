//
//  UserDefaults+Name.swift
//  AutoCompleteTextFieldSwift
//
//  Created by Sheen on 10/4/24.
//

import Foundation

extension UserDefaults {
    
    static var namkeKey = "userNames"
    
    var names: [String] {
        get {
            let userNames = object(forKey: Self.namkeKey) as? [String] ?? []
            return userNames
        }
        set {
            self.set(newValue, forKey: Self.namkeKey)
        }
    }
    
    func addName(_ name: String) {
        var userNames = names
        userNames.append(name)
        set(userNames, forKey: Self.namkeKey)
    }
}

//
//  AutoCompleteTFInteractor.swift
//  AutoCompleteTextFieldSwift
//
//  Created by Sheen on 10/4/24.
//

import Foundation

protocol AutoCompleteTFInteractable {
    func search(name: String) -> [String]
    func addName(name: String)
    func saveNames()
}

class AutoCompleteTFInteractor: AutoCompleteTFInteractable {
    private var userDefaults: UserDefaults
    private var names: Set<String>
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        names = Set(userDefaults.names)
    }
    
    func search(name: String) -> [String] {
        guard !name.isEmpty else {
            return []
        }
        let results = names.filter { $0.contains(name) }
        return Array(results)
    }
    
    func addName(name: String) {
        names.insert(name)
    }
    
    func saveNames() {
        userDefaults.names = Array(names)
    }
}

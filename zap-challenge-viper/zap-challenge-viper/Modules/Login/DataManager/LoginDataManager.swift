//
//  LoginDataManager.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 05/04/19.
//  Copyright © 2019 Renato Medina. All rights reserved.
//

import Foundation

class LoginDataManager {
    
}

extension LoginDataManager: LoginDataManagerInterface {
    func isLogged() -> Bool {
        let userDefaults = UserDefaults.standard
        guard let email = userDefaults.object(forKey: "email") as? String else {
            return false
        }
        
        return !email.isEmpty
    }
    
    func saveEmail(email: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(email, forKey: "email")
    }
    
    func clear() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "email")
    }
}

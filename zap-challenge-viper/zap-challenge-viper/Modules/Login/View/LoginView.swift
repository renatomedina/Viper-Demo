//
//  LoginView.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 05/04/19.
//  Copyright © 2019 Renato Medina. All rights reserved.
//

import UIKit

class LoginView: UIView, KeyboardControllable {
    
    @IBOutlet private weak var enterButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var validate: ((String?, String?)->Void)?    
    
    @IBAction func tapButtonEnter() {
        self.validate?(emailTextField.text, passwordTextField.text)
    }
    
    func handleKeyboardWillShow(_ notification: Notification) {
        
        let keyboardSize = notification.keyboardSize
        let keyboardHeight = keyboardSize?.height ?? 250
        
        if self.frame.origin.y == 0 {
            self.frame.origin.y -= keyboardHeight
        }
        
    }
    
    func handleKeyboardWillHide(_ notification: Notification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

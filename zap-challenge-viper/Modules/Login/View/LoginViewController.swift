//
//  LoginViewController.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 04/04/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LoginViewController: UIViewController {

    var presenter: LoginPresenterInterface!
    @IBOutlet private var loginView: LoginView!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        registerForKeyboardEvents()
        loginView.validate = { email, password in
            self.presenter.validateLogin(email: email, password: password)
        }
    }
    
    @IBAction private func close() {
        presenter.tapCloseButton()
    }
    
    deinit {
        unregisterFromKeyboardEvents()
    }
}

// MARK: - Keyboard
extension LoginViewController: KeyboardObserving {
    func keyboardWillShow(_ notification: Notification) {
        loginView.handleKeyboardWillShow(notification)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        loginView.handleKeyboardWillHide(notification)
    }
}

// MARK: - LoginViewInterface
extension LoginViewController: LoginViewInterface {
    
    func errorLogin(message: String) {
        let alert = UIAlertController(title: "Erro Login", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

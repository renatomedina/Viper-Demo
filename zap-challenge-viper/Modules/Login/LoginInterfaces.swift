//
//  LoginInterfaces.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 04/04/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum LoginNavigationOption {
    case close
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    func errorLogin(message: String)
}

protocol LoginPresenterInterface: PresenterInterface {
    func validateLogin(email: String?, password: String?) 
    func tapCloseButton()
}

protocol LoginInteractorInterface: InteractorInterface {
    func login(email: String?, password: String?) -> LoginValidationsType
    func logout()
    func isLogged() -> Bool
}

protocol LoginDataManagerInterface: DataManagerInterface {
    func isLogged() -> Bool
    func saveEmail(email: String)
    func clear()
}

//
//  ListInterfaces.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 29/03/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum ListNavigationOption {
    case details(Property)
    case login
}

protocol ListWireframeInterface: WireframeInterface {
    func navigate(to option: ListNavigationOption)
}

protocol ListViewInterface: ViewInterface {
    func reloadData()
    func setButtonTitle(text: String)
}

protocol ListPresenterInterface: PresenterInterface {
    func updateLoginButtonTitle()
    func tapLoginButton()
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Property
    func didSelectItem(at indexPath: IndexPath)
}

protocol ListInteractorInterface: InteractorInterface {
    func getProperties(completion: @escaping ([Property]) -> ())
}

protocol ListViewItemInterface {
    var title: String? { get }
    var imageURL: URL? { get }
}
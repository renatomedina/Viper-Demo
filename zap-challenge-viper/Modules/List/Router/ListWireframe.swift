//
//  ListWireframe.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 29/03/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ListWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "List", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: ListViewController.self)
        super.init(viewController: moduleViewController)
        
        let loginDataManager = LoginDataManager()
        let loginInteractor = LoginInteractor(dataManager: loginDataManager)
        let interactor = ListInteractor()
        let presenter = ListPresenter(wireframe: self, view: moduleViewController, interactor: interactor, loginInteractor: loginInteractor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ListWireframe: ListWireframeInterface {

    func navigate(to option: ListNavigationOption) {
        
        switch option {
        case .details(let property):
            self.openDetails(with: property)
            break
        case .login:
            self.openLogin() 
            break
        }
    }
    
    private func openDetails(with property: Property) {
        let detailWireframe = DetailsWireframe(property: property)
        navigationController?.pushWireframe(detailWireframe)
    }
    
    private func openLogin() {
        let loginWireframe = LoginWireframe()
        navigationController?.presentWireframe(loginWireframe)
    }
}

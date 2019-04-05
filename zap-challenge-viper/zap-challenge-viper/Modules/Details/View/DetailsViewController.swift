//
//  DetailsViewController.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 01/04/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailsViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet private weak var propertyImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    var presenter: DetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension DetailsViewController: DetailsViewInterface {
    func setTitle(title: String?) {
        self.titleLabel.text = title ?? ""
    }
    
    func setDescription(description: String?) {
        self.descriptionLabel.text = description ?? ""
    }
    
    func setImage(url: String?) {
        guard let urlImage = url else {
            //TODO: Set placeholder image
            return
        }
        
        self.propertyImage.downloaded(from: urlImage)
    }
    
}

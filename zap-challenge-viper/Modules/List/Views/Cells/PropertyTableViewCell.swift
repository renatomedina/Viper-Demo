//
//  PropertyTableViewCell.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 01/04/19.
//  Copyright © 2019 Renato Medina. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        cellImageView.layer.masksToBounds = true
//        cellImageView.layer.borderColor = UIColor.lightGray.cgColor
//        cellImageView.layer.borderWidth = 1.0 / UIScreen.main.scale
    }

    func configure(with item: Property) {
        cellTextLabel.text = item.id
        guard let urlImage = item.images.first else {
            return cellImageView.image = UIImage(imageLiteralResourceName: "image-placeholder")
        }
    
        cellImageView.downloaded(from: urlImage)
    }

}

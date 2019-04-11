//
//  KeyboardNotificationExtension.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 05/04/19.
//  Copyright © 2019 Renato Medina. All rights reserved.
//

import Foundation
import UIKit

extension Notification {
    var keyboardSize: CGSize? {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
    }
    var keyboardAnimationDuration: Double? {
        return userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
    }
}

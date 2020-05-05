//
//  UIButton.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

extension UIButton {
    
    var isValid: Bool {
        get {
            return isEnabled && backgroundColor == .enabledButtonBackgroundColor
        }
        set {
            backgroundColor = newValue ? .enabledButtonBackgroundColor : .disabledButtonBackgroundColor
//            titleLabel?.textColor = newValue ? .white : .disableButtonTextColor
            isEnabled = newValue
        }
    }
    
}

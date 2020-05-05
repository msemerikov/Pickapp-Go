//
//  Constants.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

var buttonCornerRadius: CGFloat = 4
var textFieldCornerRadius: CGFloat = 3.5
var textFieldHeight: CGFloat = 54

class Session {
    static let instance = Session()
    
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
}

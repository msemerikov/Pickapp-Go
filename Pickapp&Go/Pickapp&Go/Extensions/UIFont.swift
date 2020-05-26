//
//  UIFont.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 23.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func systemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Comfortaa-Regular", size: size) else {
            fatalError("""
                Failed to load the "Comfortaa-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func boldSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Comfortaa-Bold", size: size) else {
            fatalError("""
                Failed to load the "Comfortaa-Bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func lightSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Comfortaa-Light", size: size) else {
            fatalError("""
                Failed to load the "Comfortaa-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Comfortaa-Medium", size: size) else {
            fatalError("""
                Failed to load the "Comfortaa-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func semiBoldSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Comfortaa-SemiBold", size: size) else {
            fatalError("""
                Failed to load the "Comfortaa-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
}

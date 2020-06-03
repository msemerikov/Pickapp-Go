//
//  UITextField.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

extension UITextField {
    
//    var status: StatusTextField {
//        get {
//            return .inactive
//        }
//        set {
//            switch newValue {
//            case .active:
//                layer.borderColor = UIColor.textFieldBorderColor.cgColor
//            case .inactive:
//                layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
//            case .error:
//                layer.borderColor = UIColor.errorTextFieldBorderColor.cgColor
//            }
//        }
//    }
    
    var isInactive: Bool {
        get {
            return false
        }
        set {
            layer.borderColor = newValue ? UIColor.textFieldBorderColor.cgColor : UIColor.inactiveTextFieldBorderColor.cgColor
        }
    }
    
    var isError: Bool {
        get {
            return false
        }
        set {
            layer.borderColor = newValue ? UIColor.errorTextFieldBorderColor.cgColor : UIColor.textFieldBorderColor.cgColor
        }
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .map { $0.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
    
}

extension UITextView {
    
    var isInactive: Bool {
        get {
            return false
        }
        set {
            layer.borderColor = newValue ? UIColor.textFieldBorderColor.cgColor : UIColor.inactiveTextFieldBorderColor.cgColor
        }
    }
    
    var isError: Bool {
        get {
            return false
        }
        set {
            layer.borderColor = newValue ? UIColor.errorTextFieldBorderColor.cgColor : UIColor.textFieldBorderColor.cgColor
        }
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextView.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextView }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
    
}

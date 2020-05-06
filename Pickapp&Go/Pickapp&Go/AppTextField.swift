//
//  AppTextField.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

enum StatusTextField {
    case inactive
    case active
    case error
}

class AppTextField: UIView {
    let label = UILabel()
    let textField = UITextField()
    let errorLabel = UILabel()
    var text = ""
    var error = ""
    
    var status: StatusTextField {
        get {
            return .inactive
        }
        set {
            switch newValue {
            case .active:
                label.isHidden = false
                label.textColor = .labelColor
                errorLabel.isHidden = true
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.textFieldBorderColor.cgColor
                textField.layer.borderWidth = 2
            case .inactive:
                label.isHidden = true
                label.textColor = .labelColor
                errorLabel.isHidden = true
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
                textField.layer.borderWidth = 1
            case .error:
                label.isHidden = false
                label.textColor = .errorTextFieldBorderColor
                errorLabel.isHidden = false
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.errorTextFieldBorderColor.cgColor
                textField.layer.borderWidth = 2
            }
        }
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self.textField)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .map { $0.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
    
    convenience init(title: String, error: String) {
        self.init()
        self.text = title
        self.error = error
        setupTextField()
        setupView()
        setupLabel()
        setupErrorLabel()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 4
        clipsToBounds = true
        layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
    }
    
    private func setupTextField() {
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = textFieldCornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = text
        textField.textColor = .labelColor
        self.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
    }
    
    private func setupLabel() {
        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        let width = text.width(withConstrainedHeight: 16, font: font)
        label.backgroundColor = .white
        label.font = font
        label.text = text
        label.textAlignment = .center
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        label.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    private func setupErrorLabel() {
        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        let width = error.width(withConstrainedHeight: 16, font: font)
        errorLabel.backgroundColor = .white
        errorLabel.font = font
        errorLabel.text = error
        errorLabel.textAlignment = .left
        self.addSubview(errorLabel)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 3).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        errorLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
}

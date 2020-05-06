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
    let font = UIFont.systemFont(ofSize: 12, weight: .regular)
    var text = ""
    var error = ""
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = font
        label.text = text
        label.textAlignment = .center
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        textField.backgroundColor = .white
        textField.layer.cornerRadius = textFieldCornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = text
        textField.textColor = .labelColor
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = font
        label.text = error
        label.textAlignment = .left
        return label
    }()
    
    
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
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        [textField, label, errorLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let textFieldConstraints = [
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 9),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ]
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            label.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: 16, font: font)),
            label.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let errorLabelConstraints = [
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 3),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            errorLabel.widthAnchor.constraint(equalToConstant: error.width(withConstrainedHeight: 16, font: font)),
            errorLabel.heightAnchor.constraint(equalToConstant: 16)
        ]

        [textFieldConstraints,
         labelConstraints,
         errorLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

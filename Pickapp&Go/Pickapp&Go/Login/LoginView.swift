//
//  LoginView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class LoginView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.text = "Привет!"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.text = "Добро пожаловать в мир покупок\n без очередей!"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        let placeholder = "Номер телефона"
        textField.keyboardType = .phonePad
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = textFieldCornerRadius
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .labelColor
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = buttonCornerRadius
        button.setTitle("ПРОДОЛЖИТЬ", for: UIControl.State())
        button.setTitleColor(.disableButtonTextColor, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    lazy var policyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.text = "Нажимая «Продолжить», вы соглашаетесь \nс «Условия ипользования» и «Политикой конфиденциальности»."
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var guestButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("ВОЙТИ КАК ГОСТЬ", for: UIControl.State())
        button.setTitleColor(.enabledButtonTextColor, for: UIControl.State())
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [titleLabel, welcomeLabel, phoneTextField, loginButton, policyLabel, guestButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 104),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        let welcomeLabelConstraints = [
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalToConstant: Session.width - 40),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let phoneTextFieldConstraints = [
            phoneTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 49),
            phoneTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneTextField.widthAnchor.constraint(equalToConstant: Session.width - 17),
            phoneTextField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 29),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Session.width - 180),
            loginButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        let policyLabelConstraints = [
            policyLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            policyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            policyLabel.widthAnchor.constraint(equalToConstant: Session.width - 80),
            policyLabel.heightAnchor.constraint(equalToConstant: 43)
        ]
        
        let guestButtonConstraints = [
            guestButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -34),
            guestButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            guestButton.widthAnchor.constraint(equalToConstant: Session.width - 174),
            guestButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        [titleLabelConstraints,
         welcomeLabelConstraints,
         phoneTextFieldConstraints,
            loginButtonConstraints,
            policyLabelConstraints,
            guestButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

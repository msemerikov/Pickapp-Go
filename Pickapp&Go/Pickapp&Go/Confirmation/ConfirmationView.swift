//
//  ConfirmationView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class ConfirmationView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var codeTextField: AppTextField = {
        let textField = AppTextField(title: "Цифровой код", error: "Проверьте цифровой код")
        textField.textField.keyboardType = .numberPad
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
    
    lazy var againButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = buttonCornerRadius
        button.setTitle("ОТПРАВИТЬ ЕЩЕ РАЗ", for: UIControl.State())
        button.setTitleColor(.disableButtonTextColor, for: .disabled)
        button.setTitleColor(.white, for: .normal)
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
        [label, codeTextField, loginButton, againButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 125),
            label.heightAnchor.constraint(equalToConstant: 96),
            label.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let codeTextFieldConstraints = [
            codeTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            codeTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            codeTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            codeTextField.heightAnchor.constraint(equalToConstant: 82)
        ]

        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 29),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Session.width - 180),
            loginButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        let againButtonConstraints = [
            againButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            againButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            againButton.widthAnchor.constraint(equalToConstant: Session.width - 180),
            againButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        [labelConstraints,
         codeTextFieldConstraints,
         loginButtonConstraints,
         againButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

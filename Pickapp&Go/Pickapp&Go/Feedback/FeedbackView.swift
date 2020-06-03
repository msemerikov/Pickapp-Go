//
//  FeedbackView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class FeedbackView: UIView, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Новое обращение"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.numberOfLines = 0
        label.text = "Напишите, что вам понравилось или с чем у вас возникли проблемы"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    
    lazy var messageTextView: AppTextView = {
        let textView = AppTextView(title: "Ваше обращение", error: "")
        return textView
    }()
    
    lazy var shopTextField: AppTextField = {
        let textField = AppTextField(title: "Магазин", error: "Проверьте магазин")
        return textField
    }()
    
    lazy var emailTextField: AppTextField = {
        let textField = AppTextField(title: "Электронный адрес", error: "Проверьте email")
        textField.textField.keyboardType = .emailAddress
        textField.textField.attributedPlaceholder = NSAttributedString(string: "Почта для обратной связи",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        return textField
    }()
    
    lazy var phoneTextField: AppTextField = {
        let textField = AppTextField(title: "Телефон", error: "Проверьте телефон")
        textField.textField.keyboardType = .phonePad
        textField.textField.attributedPlaceholder = NSAttributedString(string: "+7 (___) ___-__-__",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        return textField
    }()
    
    lazy var sendButton: AddToCartButton = {
        let button = AddToCartButton()
        button.setTitle("Отправить", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .backgroundColor
        addScrollView()
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        [backButton,
         titleLabel,
         label,
         messageTextView,
         shopTextField,
         emailTextField,
         phoneTextField,
         sendButton]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32),
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: Session.width - 32),
            label.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let messageTextViewConstraints = [
            messageTextView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
            messageTextView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            messageTextView.widthAnchor.constraint(equalToConstant: Session.width - 32),
            messageTextView.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        let shopTextFieldConstraints = [
            shopTextField.topAnchor.constraint(equalTo: messageTextView.bottomAnchor),
            shopTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            shopTextField.widthAnchor.constraint(equalToConstant: Session.width - 32),
            shopTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: shopTextField.bottomAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: Session.width - 32),
            emailTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let phoneTextFieldConstraints = [
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            phoneTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            phoneTextField.widthAnchor.constraint(equalToConstant: Session.width - 32),
            phoneTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let sendButtonConstraints = [
            sendButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 24),
            sendButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 201),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        [scrollViewConstraints,
         backButtonConstraints,
         titleLabelConstraints,
         labelConstraints,
         messageTextViewConstraints,
         shopTextFieldConstraints,
         emailTextFieldConstraints,
         phoneTextFieldConstraints,
         sendButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

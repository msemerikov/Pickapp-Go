//
//  AccountView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class AccountView: UIView, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var myDataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Мои данные"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var nameTextField: AppTextField = {
        let textField = AppTextField(title: "Имя", error: "Проверьте имя")
        textField.textField.keyboardType = .default
        return textField
    }()
    
    lazy var lastnameTextField: AppTextField = {
        let textField = AppTextField(title: "Фамилия", error: "Проверьте фамилию")
        textField.textField.keyboardType = .default
        return textField
    }()
    
    lazy var birthdateTextField: AppTextField = {
        let textField = AppTextField(title: "Дата рождения", error: "Проверьте дату рождения")
        textField.textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var phoneTextField: AppTextField = {
        let textField = AppTextField(title: "Телефон", error: "Проверьте телефон")
        textField.textField.keyboardType = .phonePad
        return textField
    }()
    
    lazy var emailTextField: AppTextField = {
        let textField = AppTextField(title: "Email", error: "Проверьте email")
        textField.textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var eventsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Реклама и акции"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "История заказов"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var storyDivider = DividerView()
    
    lazy var supportLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Поддержка"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var supportDivider = DividerView()
    
    lazy var notificationsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Уведомления"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var pushLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Push-уведомления"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var pushSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var pushDivider = DividerView()
    
    lazy var smsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "SMS рассылка"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var smsSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var smsDivider = DividerView()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        label.text = "Email рассылка"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var emailSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var emailDivider = DividerView()
    
    init() {
        super.init(frame: .zero)
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
        [myDataLabel,
         nameTextField,
         lastnameTextField,
         birthdateTextField,
         phoneTextField,
         emailTextField,
         eventsLabel,
         storyLabel,
         storyDivider,
         supportLabel,
         supportDivider,
         notificationsLabel,
         pushLabel,
         pushSwitch,
         pushDivider,
         smsLabel,
         smsSwitch,
         smsDivider,
         emailLabel,
         emailSwitch,
         emailDivider]
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
        
        let myDataLabelConstraints = [
            myDataLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            myDataLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            myDataLabel.heightAnchor.constraint(equalToConstant: 24),
            myDataLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let nameTextFieldConstraints = [
            nameTextField.topAnchor.constraint(equalTo: myDataLabel.bottomAnchor, constant: 13),
            nameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            nameTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let lastnameTextFieldConstraints = [
            lastnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            lastnameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lastnameTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            lastnameTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let birthdateTextFieldConstraints = [
            birthdateTextField.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor),
            birthdateTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            birthdateTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            birthdateTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let phoneTextFieldConstraints = [
            phoneTextField.topAnchor.constraint(equalTo: birthdateTextField.bottomAnchor),
            phoneTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            phoneTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            phoneTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: Session.width - 34),
            emailTextField.heightAnchor.constraint(equalToConstant: 82)
        ]
        
        let eventsLabelConstraints = [
            eventsLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            eventsLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            eventsLabel.heightAnchor.constraint(equalToConstant: 24),
            eventsLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let storyLabelConstraints = [
            storyLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            storyLabel.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 24),
            storyLabel.heightAnchor.constraint(equalToConstant: 24),
            storyLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let storyDividerConstraints = [
            storyDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            storyDivider.topAnchor.constraint(equalTo: storyLabel.bottomAnchor, constant: 11),
            storyDivider.heightAnchor.constraint(equalToConstant: 1),
            storyDivider.widthAnchor.constraint(equalToConstant: Session.width - 16)
        ]
        
        let supportLabelConstraints = [
            supportLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            supportLabel.topAnchor.constraint(equalTo: storyLabel.bottomAnchor, constant: 24),
            supportLabel.heightAnchor.constraint(equalToConstant: 24),
            supportLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let supportDividerConstraints = [
            supportDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            supportDivider.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 11),
            supportDivider.heightAnchor.constraint(equalToConstant: 1),
            supportDivider.widthAnchor.constraint(equalToConstant: Session.width - 16)
        ]
        
        let notificationsLabelConstraints = [
            notificationsLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            notificationsLabel.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 36),
            notificationsLabel.heightAnchor.constraint(equalToConstant: 24),
            notificationsLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let pushLabelConstraints = [
            pushLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            pushLabel.topAnchor.constraint(equalTo: notificationsLabel.bottomAnchor, constant: 24),
            pushLabel.heightAnchor.constraint(equalToConstant: 24),
            pushLabel.widthAnchor.constraint(equalToConstant: Session.width / 2)
        ]
        
        let pushSwitchConstraints = [
            pushSwitch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 65),
            pushSwitch.centerYAnchor.constraint(equalTo: pushLabel.centerYAnchor),
            pushSwitch.heightAnchor.constraint(equalToConstant: 31),
            pushSwitch.widthAnchor.constraint(equalToConstant: 49)
        ]
        
        let pushDividerConstraints = [
            pushDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            pushDivider.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: 11),
            pushDivider.heightAnchor.constraint(equalToConstant: 1),
            pushDivider.widthAnchor.constraint(equalToConstant: Session.width - 16)
        ]
        
        let smsLabelConstraints = [
            smsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            smsLabel.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: 24),
            smsLabel.heightAnchor.constraint(equalToConstant: 24),
            smsLabel.widthAnchor.constraint(equalToConstant: Session.width / 2)
        ]
        
        let smsSwitchConstraints = [
            smsSwitch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 65),
            smsSwitch.centerYAnchor.constraint(equalTo: smsLabel.centerYAnchor),
            smsSwitch.heightAnchor.constraint(equalToConstant: 31),
            smsSwitch.widthAnchor.constraint(equalToConstant: 49)
        ]
        
        let smsDividerConstraints = [
            smsDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            smsDivider.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: 11),
            smsDivider.heightAnchor.constraint(equalToConstant: 1),
            smsDivider.widthAnchor.constraint(equalToConstant: Session.width - 16)
        ]
        
        let emailLabelConstraints = [
            emailLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: 24),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
            emailLabel.widthAnchor.constraint(equalToConstant: Session.width / 2)
        ]
        
        let emailSwitchConstraints = [
            emailSwitch.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 65),
            emailSwitch.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailSwitch.heightAnchor.constraint(equalToConstant: 31),
            emailSwitch.widthAnchor.constraint(equalToConstant: 49)
        ]
        
        let emailDividerConstraints = [
            emailDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            emailDivider.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 11),
            emailDivider.heightAnchor.constraint(equalToConstant: 1),
            emailDivider.widthAnchor.constraint(equalToConstant: Session.width - 16)
        ]
        
        [scrollViewConstraints,
         myDataLabelConstraints,
         nameTextFieldConstraints,
         lastnameTextFieldConstraints,
         birthdateTextFieldConstraints,
         phoneTextFieldConstraints,
         emailTextFieldConstraints,
         eventsLabelConstraints,
         storyLabelConstraints,
         storyDividerConstraints,
         supportLabelConstraints,
         supportDividerConstraints,
         notificationsLabelConstraints,
         pushLabelConstraints,
         pushSwitchConstraints,
         pushDividerConstraints,
         smsLabelConstraints,
         smsSwitchConstraints,
         smsDividerConstraints,
         emailLabelConstraints,
         emailSwitchConstraints,
         emailDividerConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}


//
//  PlaceOrderView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class PlaceOrderView: UIView, UIScrollViewDelegate {
    
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
        label.text = "Детали заказа"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var shopLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Магазин"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var shopValueLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Виктория - Долгопрудная, 74 ТРК «Облака»"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var missingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "В случае если товар отсутствует:"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var changeToAnalogLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Заменить на аналогичный"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var changeToAnalogSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var changeToAnalogDivider = DividerView()
    
    lazy var callToChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Позвонить и согласовать замену"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var callToChangeSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var callToChangeDivider = DividerView()
    
    lazy var deleteItemLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Удалить товар"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var deleteItemSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var deleteItemDivider = DividerView()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Комментарий для магазина:"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var commentTextField: AppTextField = {
        let textField = AppTextField(title: "Комментарий", error: "Проверьте комментарий")
        return textField
    }()
    
    lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Способы оплаты:"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var applePayLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Apple Pay"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var applePaySwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var applePayDivider = DividerView()
    
    lazy var cardLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Банковская карта"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var cardSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var cardDivider = DividerView()
    
    lazy var cashLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 1
        label.text = "Оплата в магазине"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var cashSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    lazy var cashDivider = DividerView()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Сумма заказа:"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .labelColor
        return label
    }()
    
    lazy var payButton: AddToCartButton = {
        let button = AddToCartButton()
        button.setTitle("Оплатить", for: .normal)
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
         shopLabel,
         shopValueLabel,
         missingLabel,
         changeToAnalogLabel,
         changeToAnalogSwitch,
         changeToAnalogDivider,
         callToChangeLabel,
         callToChangeSwitch,
         callToChangeDivider,
         deleteItemLabel,
         deleteItemSwitch,
         deleteItemDivider,
         commentLabel,
         commentTextField,
         paymentLabel,
         applePayLabel,
         applePaySwitch,
         applePayDivider,
         cardLabel,
         cardSwitch,
         cardDivider,
         cashLabel,
         cashSwitch,
         cashDivider,
         totalLabel,
         totalValueLabel,
         payButton]
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
        
        let shopLabelConstraints = [
            shopLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32),
            shopLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            shopLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 32),
            shopLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let shopValueLabelConstraints = [
            shopValueLabel.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 16),
            shopValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            shopValueLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 32),
            shopValueLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let missingLabelConstraints = [
            missingLabel.topAnchor.constraint(equalTo: shopValueLabel.bottomAnchor, constant: 16),
            missingLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            missingLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 32),
            missingLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let changeToAnalogLabelConstraints = [
            changeToAnalogLabel.topAnchor.constraint(equalTo: missingLabel.bottomAnchor, constant: 28),
            changeToAnalogLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            changeToAnalogLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            changeToAnalogLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let changeToAnalogSwitchConstraints = [
            changeToAnalogSwitch.centerYAnchor.constraint(equalTo: changeToAnalogLabel.centerYAnchor),
            changeToAnalogSwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            changeToAnalogSwitch.widthAnchor.constraint(equalToConstant: 49),
            changeToAnalogSwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let changeToAnalogDividerConstraints = [
            changeToAnalogDivider.topAnchor.constraint(equalTo: changeToAnalogLabel.bottomAnchor, constant: 9),
            changeToAnalogDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            changeToAnalogDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            changeToAnalogDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let callToChangeLabelConstraints = [
            callToChangeLabel.topAnchor.constraint(equalTo: changeToAnalogDivider.bottomAnchor, constant: 12),
            callToChangeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            callToChangeLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            callToChangeLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let callToChangeSwitchConstraints = [
            callToChangeSwitch.centerYAnchor.constraint(equalTo: callToChangeLabel.centerYAnchor),
            callToChangeSwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            callToChangeSwitch.widthAnchor.constraint(equalToConstant: 49),
            callToChangeSwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let callToChangeDividerConstraints = [
            callToChangeDivider.topAnchor.constraint(equalTo: callToChangeLabel.bottomAnchor, constant: 9),
            callToChangeDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            callToChangeDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            callToChangeDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let deleteItemLabelConstraints = [
            deleteItemLabel.topAnchor.constraint(equalTo: callToChangeDivider.bottomAnchor, constant: 12),
            deleteItemLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            deleteItemLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            deleteItemLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let deleteItemSwitchConstraints = [
            deleteItemSwitch.centerYAnchor.constraint(equalTo: deleteItemLabel.centerYAnchor),
            deleteItemSwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            deleteItemSwitch.widthAnchor.constraint(equalToConstant: 49),
            deleteItemSwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let deleteItemDividerConstraints = [
            deleteItemDivider.topAnchor.constraint(equalTo: deleteItemLabel.bottomAnchor, constant: 9),
            deleteItemDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            deleteItemDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            deleteItemDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let commentLabelConstraints = [
            commentLabel.topAnchor.constraint(equalTo: deleteItemDivider.bottomAnchor, constant: 16),
            commentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            commentLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            commentLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let commentTextFieldConstraints = [
            commentTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            commentTextField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 8),
            commentTextField.heightAnchor.constraint(equalToConstant: 82),
            commentTextField.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let paymentLabelConstraints = [
            paymentLabel.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 16),
            paymentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            paymentLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            paymentLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let applePayLabelConstraints = [
            applePayLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 28),
            applePayLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            applePayLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            applePayLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let applePaySwitchConstraints = [
            applePaySwitch.centerYAnchor.constraint(equalTo: applePayLabel.centerYAnchor),
            applePaySwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            applePaySwitch.widthAnchor.constraint(equalToConstant: 49),
            applePaySwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let applePayDividerConstraints = [
            applePayDivider.topAnchor.constraint(equalTo: applePayLabel.bottomAnchor, constant: 9),
            applePayDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            applePayDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            applePayDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let cardLabelConstraints = [
            cardLabel.topAnchor.constraint(equalTo: applePayDivider.bottomAnchor, constant: 12),
            cardLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            cardLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let cardSwitchConstraints = [
            cardSwitch.centerYAnchor.constraint(equalTo: cardLabel.centerYAnchor),
            cardSwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            cardSwitch.widthAnchor.constraint(equalToConstant: 49),
            cardSwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let cardDividerConstraints = [
            cardDivider.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 9),
            cardDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cardDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            cardDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let cashLabelConstraints = [
            cashLabel.topAnchor.constraint(equalTo: cardDivider.bottomAnchor, constant: 12),
            cashLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cashLabel.widthAnchor.constraint(equalToConstant: Session.width - 65),
            cashLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let cashSwitchConstraints = [
            cashSwitch.centerYAnchor.constraint(equalTo: cashLabel.centerYAnchor),
            cashSwitch.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            cashSwitch.widthAnchor.constraint(equalToConstant: 49),
            cashSwitch.heightAnchor.constraint(equalToConstant: 31)
        ]
        
        let cashDividerConstraints = [
            cashDivider.topAnchor.constraint(equalTo: cashLabel.bottomAnchor, constant: 9),
            cashDivider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            cashDivider.widthAnchor.constraint(equalToConstant: Session.width - 16),
            cashDivider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let totalLabelConstraints = [
            totalLabel.topAnchor.constraint(equalTo: cashDivider.bottomAnchor, constant: 16),
            totalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let totalValueLabelConstraints = [
            totalValueLabel.topAnchor.constraint(equalTo: cashDivider.bottomAnchor, constant: 16),
            totalValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalValueLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            totalValueLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let payButtonConstraints = [
            payButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            payButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            payButton.widthAnchor.constraint(equalToConstant: 201),
            payButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        [scrollViewConstraints,
         backButtonConstraints,
         titleLabelConstraints,
         shopLabelConstraints,
         shopValueLabelConstraints,
         missingLabelConstraints,
         changeToAnalogLabelConstraints,
         changeToAnalogSwitchConstraints,
         changeToAnalogDividerConstraints,
         callToChangeLabelConstraints,
         callToChangeSwitchConstraints,
         callToChangeDividerConstraints,
         deleteItemLabelConstraints,
         deleteItemSwitchConstraints,
         deleteItemDividerConstraints,
         commentLabelConstraints,
         commentTextFieldConstraints,
         paymentLabelConstraints,
         applePayLabelConstraints,
         applePaySwitchConstraints,
         applePayDividerConstraints,
         cardLabelConstraints,
         cardSwitchConstraints,
         cardDividerConstraints,
         cashLabelConstraints,
         cashSwitchConstraints,
         cashDividerConstraints,
         totalLabelConstraints,
         totalValueLabelConstraints,
         payButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

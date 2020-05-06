//
//  MainView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class MainView: UIView {
    
    lazy var shopLabel: ShopLabel = {
        let label = ShopLabel(title: "Авоська", subtitle: "Казакова, 24")
        return label
    }()
    
    lazy var eventsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Категории"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allCategoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: UIControl.State())
        button.setTitleColor(.labelColor, for: UIControl.State())
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var buyerChoiceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Выбор покупателей"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allBuyerChoiceButton: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: UIControl.State())
        button.setTitleColor(.labelColor, for: UIControl.State())
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    /*
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
    */
    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [shopLabel, eventsCollectionView, categoryLabel, allCategoryButton, categoryCollectionView, buyerChoiceLabel, allBuyerChoiceButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let shopLabelConstraints = [
            shopLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shopLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            shopLabel.heightAnchor.constraint(equalToConstant: 64),
            shopLabel.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        let eventsCollectionViewConstraints = [
            eventsCollectionView.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 12),
            eventsCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            eventsCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            eventsCollectionView.heightAnchor.constraint(equalToConstant: 123)
        ]

        let categoryLabelConstraints = [
            categoryLabel.topAnchor.constraint(equalTo: eventsCollectionView.bottomAnchor, constant: 24),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            categoryLabel.widthAnchor.constraint(equalToConstant: 82),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24)
        ]

        let allCategoryButtonConstraints = [
            allCategoryButton.topAnchor.constraint(equalTo: categoryLabel.topAnchor),
            allCategoryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            allCategoryButton.widthAnchor.constraint(equalToConstant: 52),
            allCategoryButton.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 12),
            categoryCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let buyerChoiceLabelConstraints = [
            buyerChoiceLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            buyerChoiceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buyerChoiceLabel.widthAnchor.constraint(equalToConstant: 155),
            buyerChoiceLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let allBuyerChoiceButtonConstraints = [
            allBuyerChoiceButton.topAnchor.constraint(equalTo: buyerChoiceLabel.topAnchor),
            allBuyerChoiceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            allBuyerChoiceButton.widthAnchor.constraint(equalToConstant: 52),
            allBuyerChoiceButton.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [shopLabelConstraints,
         eventsCollectionViewConstraints,
         categoryLabelConstraints,
         allCategoryButtonConstraints,
         categoryCollectionViewConstraints,
         buyerChoiceLabelConstraints,
         allBuyerChoiceButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

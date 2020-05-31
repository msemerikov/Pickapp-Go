//
//  ProductView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class ProductView: UIView, UIScrollViewDelegate {
    
//    var descriptionHeight: CGFloat?
//    var descriptionHeightConstraint: NSLayoutConstraint?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        return button
    }()
    
    lazy var likeButton: LikeButton = {
        let button = LikeButton()
        return button
    }()
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 20)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 28)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .labelColor
        return label
    }()
    
    lazy var addToCartButton: AddToCartButton = {
        let button = AddToCartButton()
        return button
    }()
    
    lazy var nutritionalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Пищевая ценность"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var proteinValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var fatsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var carbohydratesValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var caloriesValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var proteinLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 10)
        label.numberOfLines = 1
        label.text = "белков"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var fatsLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 10)
        label.numberOfLines = 1
        label.text = "жиров"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var carbohydratesLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 10)
        label.numberOfLines = 1
        label.text = "углеводов"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var caloriesLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 10)
        label.numberOfLines = 1
        label.text = "кКал на 100 гр"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Описание"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Информация"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var brandRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Бренд", rightLabel: "", withLine: false)
        return row
    }()
    
    lazy var originRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Страна происхождения", rightLabel: "", withLine: true)
        return row
    }()
    
    lazy var typeRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Тип питания", rightLabel: "", withLine: true)
        return row
    }()
    
    lazy var tempRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Температура хранения", rightLabel: "", withLine: true)
        return row
    }()
    
    lazy var conditionRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Условия хранения", rightLabel: "", withLine: true)
        return row
    }()
    
    lazy var categoryRow: ProductInfoRowView = {
        let row = ProductInfoRowView(leftLabel: "Категория", rightLabel: "", withLine: true)
        return row
    }()
    
    lazy var relatedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 20)
        label.numberOfLines = 1
        label.text = "С этим товаром покупают"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var relatedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: Session.width).isActive = true
    }
    
    private func addSubviews() {
        [backButton,
         likeButton,
         productImage,
         titleLabel,
         priceLabel,
         addToCartButton,
         nutritionalLabel,
         proteinValueLabel,
         fatsValueLabel,
         carbohydratesValueLabel,
         caloriesValueLabel,
         proteinLabel,
         fatsLabel,
         carbohydratesLabel,
         caloriesLabel,
         descriptionLabel,
         descriptionValueLabel,
         informationLabel,
         brandRow,
         originRow,
         typeRow,
         tempRow,
         conditionRow,
         categoryRow,
         relatedLabel,
         relatedCollectionView]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelHeight: CGFloat = 32
        
        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            likeButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 20),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let productImageConstraints = [
            productImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 6),
            productImage.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 4),
            productImage.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -4),
            productImage.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 64),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalToConstant: (Session.width / 2) - 16 ),
            titleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let priceLabelConstraints = [
            priceLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            priceLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 64),
            priceLabel.widthAnchor.constraint(equalToConstant: (Session.width / 2) - 16),
            priceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let addToCartButtonConstraints = [
            addToCartButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            addToCartButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            addToCartButton.widthAnchor.constraint(equalToConstant: 201),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let nutritionalLabelConstraints = [
            nutritionalLabel.topAnchor.constraint(equalTo: addToCartButton.bottomAnchor, constant: 40),
            nutritionalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            nutritionalLabel.widthAnchor.constraint(equalToConstant: Session.width - 32),
            nutritionalLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let proteinValueLabelConstraints = [
            proteinValueLabel.topAnchor.constraint(equalTo: nutritionalLabel.bottomAnchor, constant: 24),
            proteinValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
            proteinValueLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            proteinValueLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let fatsValueLabelConstraints = [
            fatsValueLabel.topAnchor.constraint(equalTo: nutritionalLabel.bottomAnchor, constant: 24),
            fatsValueLabel.leadingAnchor.constraint(equalTo: proteinValueLabel.trailingAnchor),
            fatsValueLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            fatsValueLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let carbohydratesValueLabelConstraints = [
            carbohydratesValueLabel.topAnchor.constraint(equalTo: nutritionalLabel.bottomAnchor, constant: 24),
            carbohydratesValueLabel.leadingAnchor.constraint(equalTo: fatsValueLabel.trailingAnchor),
            carbohydratesValueLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            carbohydratesValueLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let caloriesValueLabelConstraints = [
            caloriesValueLabel.topAnchor.constraint(equalTo: nutritionalLabel.bottomAnchor, constant: 24),
            caloriesValueLabel.leadingAnchor.constraint(equalTo: carbohydratesValueLabel.trailingAnchor),
            caloriesValueLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            caloriesValueLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let proteinLabelConstraints = [
            proteinLabel.topAnchor.constraint(equalTo: proteinValueLabel.bottomAnchor, constant: 4),
            proteinLabel.centerXAnchor.constraint(equalTo: proteinValueLabel.centerXAnchor),
            proteinLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            proteinLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let fatsLabelConstraints = [
            fatsLabel.topAnchor.constraint(equalTo: fatsValueLabel.bottomAnchor, constant: 4),
            fatsLabel.centerXAnchor.constraint(equalTo: fatsValueLabel.centerXAnchor),
            fatsLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            fatsLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let carbohydratesLabelConstraints = [
            carbohydratesLabel.topAnchor.constraint(equalTo: carbohydratesValueLabel.bottomAnchor, constant: 4),
            carbohydratesLabel.centerXAnchor.constraint(equalTo: carbohydratesValueLabel.centerXAnchor),
            carbohydratesLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            carbohydratesLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let caloriesLabelConstraints = [
            caloriesLabel.topAnchor.constraint(equalTo: caloriesValueLabel.bottomAnchor, constant: 4),
            caloriesLabel.centerXAnchor.constraint(equalTo: caloriesValueLabel.centerXAnchor),
            caloriesLabel.widthAnchor.constraint(equalToConstant: (Session.width - 64) / 4),
            caloriesLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: proteinLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionLabel.widthAnchor.constraint(equalToConstant: Session.width - 32),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let descriptionValueLabelConstraints = [
            descriptionValueLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            descriptionValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionValueLabel.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let informationLabelConstraints = [
            informationLabel.topAnchor.constraint(equalTo: descriptionValueLabel.bottomAnchor, constant: 22),
            informationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            informationLabel.widthAnchor.constraint(equalToConstant: Session.width - 32),
            informationLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let brandRowConstraints = [
            brandRow.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 16),
            brandRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            brandRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            brandRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let originRowConstraints = [
            originRow.topAnchor.constraint(equalTo: brandRow.bottomAnchor, constant: 8),
            originRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            originRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            originRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let typeRowConstraints = [
            typeRow.topAnchor.constraint(equalTo: originRow.bottomAnchor, constant: 8),
            typeRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            typeRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            typeRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let tempRowConstraints = [
            tempRow.topAnchor.constraint(equalTo: typeRow.bottomAnchor, constant: 8),
            tempRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            tempRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            tempRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let conditionRowConstraints = [
            conditionRow.topAnchor.constraint(equalTo: tempRow.bottomAnchor, constant: 8),
            conditionRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            conditionRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            conditionRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let categoryRowConstraints = [
            categoryRow.topAnchor.constraint(equalTo: conditionRow.bottomAnchor, constant: 8),
            categoryRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoryRow.widthAnchor.constraint(equalToConstant: Session.width - 32),
            categoryRow.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let relatedLabelConstraints = [
            relatedLabel.topAnchor.constraint(equalTo: categoryRow.bottomAnchor, constant: 28),
            relatedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            relatedLabel.widthAnchor.constraint(equalToConstant: Session.width - 32),
            relatedLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let relatedCollectionViewConstraints = [
            relatedCollectionView.topAnchor.constraint(equalTo: relatedLabel.bottomAnchor, constant: 12),
            relatedCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            relatedCollectionView.widthAnchor.constraint(equalToConstant: Session.width - 16),
            relatedCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        [backButtonConstraints,
         likeButtonConstraints,
         productImageConstraints,
         titleLabelConstraints,
         priceLabelConstraints,
         addToCartButtonConstraints,
         nutritionalLabelConstraints,
         proteinValueLabelConstraints,
         fatsValueLabelConstraints,
         carbohydratesValueLabelConstraints,
         caloriesValueLabelConstraints,
         proteinLabelConstraints,
         fatsLabelConstraints,
         carbohydratesLabelConstraints,
         caloriesLabelConstraints,
         descriptionLabelConstraints,
         descriptionValueLabelConstraints,
         informationLabelConstraints,
         brandRowConstraints,
         originRowConstraints,
         typeRowConstraints,
         tempRowConstraints,
         conditionRowConstraints,
         categoryRowConstraints,
         relatedLabelConstraints,
         relatedCollectionViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
}

//
//  MainView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class MainView: UIView, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
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
    
    lazy var buyerChoiceCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var newsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var newProductLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Новинки недели"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allNewProductButton: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: UIControl.State())
        button.setTitleColor(.labelColor, for: UIControl.State())
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    
    lazy var newProductCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var salesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.text = "Товары со скидками"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allSalesButton: UIButton = {
        let button = UIButton()
        button.setTitle("См. все", for: UIControl.State())
        button.setTitleColor(.labelColor, for: UIControl.State())
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return button
    }()
    
    lazy var salesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
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
        [shopLabel,
         eventsCollectionView,
         categoryLabel,
         allCategoryButton,
         categoryCollectionView,
         buyerChoiceLabel,
         allBuyerChoiceButton,
         buyerChoiceCollectionView,
         newsCollectionView,
         newProductLabel,
         allNewProductButton,
         newProductCollectionView,
         salesLabel,
         allSalesButton,
         salesCollectionView]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let allButtonWidth: CGFloat = 52
        let labelHeight: CGFloat = 24
        let labelWidth: CGFloat = 161
        
        let shopLabelConstraints = [
            shopLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            shopLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 55),
            shopLabel.heightAnchor.constraint(equalToConstant: 64),
            shopLabel.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        let eventsCollectionViewConstraints = [
            eventsCollectionView.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 12),
            eventsCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            eventsCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            eventsCollectionView.heightAnchor.constraint(equalToConstant: 123)
        ]
        
        let categoryLabelConstraints = [
            categoryLabel.topAnchor.constraint(equalTo: eventsCollectionView.bottomAnchor, constant: 24),
            categoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoryLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            categoryLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allCategoryButtonConstraints = [
            allCategoryButton.topAnchor.constraint(equalTo: categoryLabel.topAnchor),
            allCategoryButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            allCategoryButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allCategoryButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 12),
            categoryCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let buyerChoiceLabelConstraints = [
            buyerChoiceLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            buyerChoiceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buyerChoiceLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            buyerChoiceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allBuyerChoiceButtonConstraints = [
            allBuyerChoiceButton.topAnchor.constraint(equalTo: buyerChoiceLabel.topAnchor),
            allBuyerChoiceButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            allBuyerChoiceButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allBuyerChoiceButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let buyerChoiceCollectionViewConstraints = [
            buyerChoiceCollectionView.topAnchor.constraint(equalTo: buyerChoiceLabel.bottomAnchor, constant: 12),
            buyerChoiceCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buyerChoiceCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            buyerChoiceCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let newsCollectionViewConstraints = [
            newsCollectionView.topAnchor.constraint(equalTo: buyerChoiceCollectionView.bottomAnchor, constant: 24),
            newsCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            newsCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            newsCollectionView.heightAnchor.constraint(equalToConstant: 123)
        ]
        
        let newProductLabelConstraints = [
            newProductLabel.topAnchor.constraint(equalTo: newsCollectionView.bottomAnchor, constant: 24),
            newProductLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            newProductLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            newProductLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allNewProductButtonConstraints = [
            allNewProductButton.topAnchor.constraint(equalTo: newProductLabel.topAnchor),
            allNewProductButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            allNewProductButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allNewProductButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let newProductCollectionViewConstraints = [
            newProductCollectionView.topAnchor.constraint(equalTo: newProductLabel.bottomAnchor, constant: 12),
            newProductCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            newProductCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            newProductCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let salesLabelConstraints = [
            salesLabel.topAnchor.constraint(equalTo: newProductCollectionView.bottomAnchor, constant: 24),
            salesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            salesLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            salesLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allSalesButtonConstraints = [
            allSalesButton.topAnchor.constraint(equalTo: salesLabel.topAnchor),
            allSalesButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            allSalesButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allSalesButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let salesCollectionViewConstraints = [
            salesCollectionView.topAnchor.constraint(equalTo: salesLabel.bottomAnchor, constant: 12),
            salesCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            salesCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            salesCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        [shopLabelConstraints,
         eventsCollectionViewConstraints,
         categoryLabelConstraints,
         allCategoryButtonConstraints,
         categoryCollectionViewConstraints,
         buyerChoiceLabelConstraints,
         allBuyerChoiceButtonConstraints,
         buyerChoiceCollectionViewConstraints,
         newsCollectionViewConstraints,
         newProductLabelConstraints,
         allNewProductButtonConstraints,
         newProductCollectionViewConstraints,
         salesLabelConstraints,
         allSalesButtonConstraints,
         salesCollectionViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
}

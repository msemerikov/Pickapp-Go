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
    
    lazy var shopImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ShopImage")
        return imageView
    }()

    lazy var shopCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .backgroundColor
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .backgroundColor
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Поиск продуктов"
        searchBar.searchTextField.font = .mediumSystemFontOfSize(size: 14)
        searchBar.setImage(UIImage(named: "SearchIcon"), for: UISearchBar.Icon.search, state: [])
        searchBar.searchTextField.layer.cornerRadius = 12
        searchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.12).cgColor
        searchBar.searchTextField.layer.shadowOffset = CGSize(width: 2, height: 2)
        searchBar.searchTextField.layer.shadowRadius = 4.0
        searchBar.searchTextField.layer.shadowOpacity = 1.0
        return searchBar
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Категории"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allCategoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Chevron"), for: .normal)
        return button
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var buyerChoiceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Выбор покупателей"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allBuyerChoiceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Chevron"), for: .normal)
        return button
    }()
    
    lazy var buyerChoiceCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    lazy var newProductLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Новинки недели"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allNewProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Chevron"), for: .normal)
        return button
    }()
    
    lazy var newProductCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var salesLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Товары со скидками"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var allSalesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Chevron"), for: .normal)
        return button
    }()
    
    lazy var salesCollectionView: UICollectionView = {
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
        [shopImage,
         shopCollectionView,
         searchBar,
         categoryLabel,
         allCategoryButton,
         categoryCollectionView,
         buyerChoiceLabel,
         allBuyerChoiceButton,
         buyerChoiceCollectionView,
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
        let labelWidth: CGFloat = 201
        
        let shopImageConstraints = [
            shopImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            shopImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            shopImage.widthAnchor.constraint(equalToConstant: Session.width),
            shopImage.heightAnchor.constraint(equalTo: shopImage.widthAnchor, multiplier: 5 / 9)
        ]
        
        let shopCollectionViewConstraints = [
            shopCollectionView.centerYAnchor.constraint(equalTo: shopImage.bottomAnchor),
            shopCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            shopCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            shopCollectionView.heightAnchor.constraint(equalToConstant: 192)
        ]
        
        let searchBarConstraints = [
            searchBar.topAnchor.constraint(equalTo: shopCollectionView.bottomAnchor, constant: 8),
            searchBar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            searchBar.widthAnchor.constraint(equalToConstant: Session.width - 32),
            searchBar.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let categoryLabelConstraints = [
            categoryLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24),
            categoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            categoryLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            categoryLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allCategoryButtonConstraints = [
            allCategoryButton.centerYAnchor.constraint(equalTo: categoryLabel.centerYAnchor),
            allCategoryButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width),
            allCategoryButton.widthAnchor.constraint(equalToConstant: 48),
            allCategoryButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let categoryCollectionViewConstraints = [
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 12),
            categoryCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        let buyerChoiceLabelConstraints = [
            buyerChoiceLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            buyerChoiceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buyerChoiceLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            buyerChoiceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allBuyerChoiceButtonConstraints = [
            allBuyerChoiceButton.topAnchor.constraint(equalTo: buyerChoiceLabel.topAnchor),
            allBuyerChoiceButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width),
            allBuyerChoiceButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allBuyerChoiceButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let buyerChoiceCollectionViewConstraints = [
            buyerChoiceCollectionView.topAnchor.constraint(equalTo: buyerChoiceLabel.bottomAnchor, constant: 12),
            buyerChoiceCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buyerChoiceCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            buyerChoiceCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let newProductLabelConstraints = [
            newProductLabel.topAnchor.constraint(equalTo: buyerChoiceCollectionView.bottomAnchor, constant: 24),
            newProductLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            newProductLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            newProductLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let allNewProductButtonConstraints = [
            allNewProductButton.topAnchor.constraint(equalTo: newProductLabel.topAnchor),
            allNewProductButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width),
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
            allSalesButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width),
            allSalesButton.widthAnchor.constraint(equalToConstant: allButtonWidth),
            allSalesButton.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let salesCollectionViewConstraints = [
            salesCollectionView.topAnchor.constraint(equalTo: salesLabel.bottomAnchor, constant: 12),
            salesCollectionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            salesCollectionView.widthAnchor.constraint(equalToConstant: Session.width),
            salesCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        [shopImageConstraints,
         shopCollectionViewConstraints,
         searchBarConstraints,
         categoryLabelConstraints,
         allCategoryButtonConstraints,
         categoryCollectionViewConstraints,
         buyerChoiceLabelConstraints,
         allBuyerChoiceButtonConstraints,
         buyerChoiceCollectionViewConstraints,
         newProductLabelConstraints,
         allNewProductButtonConstraints,
         newProductCollectionViewConstraints,
         salesLabelConstraints,
         allSalesButtonConstraints,
         salesCollectionViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
}

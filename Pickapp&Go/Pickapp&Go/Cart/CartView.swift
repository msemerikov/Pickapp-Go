//
//  CartView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class CartView: UIView, UIScrollViewDelegate {
    
    var tableViewHeightConstraint: NSLayoutConstraint?
    
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
        label.text = "Корзина"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var productTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.layer.masksToBounds = false
//        tableView.isScrollEnabled = false
        return tableView
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Сумма заказа"
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
    
    lazy var recommendedLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Рекомендованные товары"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var recommendedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Chevron"), for: .normal)
        return button
    }()
    
    lazy var recommendedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var addToCartButton: AddToCartButton = {
        let button = AddToCartButton()
        button.setTitle("Оформить заказ", for: .normal)
        return button
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
         titleLabel,
         productTableView,
         totalLabel,
         totalValueLabel,
         recommendedLabel,
         recommendedButton,
         recommendedCollectionView,
         addToCartButton]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelHeight = 24.f

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
            titleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let productTableViewConstraints = [
            productTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32),
            productTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            productTableView.widthAnchor.constraint(equalToConstant: Session.width - 32)
        ]
        
        let totalLabelConstraints = [
            totalLabel.topAnchor.constraint(equalTo: productTableView.bottomAnchor, constant: 32),
            totalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let totalValueLabelConstraints = [
            totalValueLabel.topAnchor.constraint(equalTo: productTableView.bottomAnchor, constant: 32),
            totalValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalValueLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            totalValueLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let recommendedLabelConstraints = [
            recommendedLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 28),
            recommendedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            recommendedLabel.widthAnchor.constraint(equalToConstant: Session.width - 56),
            recommendedLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let recommendedButtonConstraints = [
            recommendedButton.centerYAnchor.constraint(equalTo: recommendedLabel.centerYAnchor),
            recommendedButton.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width),
            recommendedButton.widthAnchor.constraint(equalToConstant: 48),
            recommendedButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let recommendedCollectionViewConstraints = [
            recommendedCollectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 12),
            recommendedCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            recommendedCollectionView.widthAnchor.constraint(equalToConstant: Session.width - 16),
            recommendedCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let addToCartButtonConstraints = [
            addToCartButton.topAnchor.constraint(equalTo: recommendedCollectionView.bottomAnchor, constant: 16),
            addToCartButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            addToCartButton.widthAnchor.constraint(equalToConstant: 201),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        [backButtonConstraints,
         titleLabelConstraints,
         productTableViewConstraints,
         totalLabelConstraints,
         totalValueLabelConstraints,
         recommendedLabelConstraints,
         recommendedButtonConstraints,
         recommendedCollectionViewConstraints,
         addToCartButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

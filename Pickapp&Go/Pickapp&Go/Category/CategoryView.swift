//
//  CategoryView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class CategoryView: UIView {
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        button.layer.masksToBounds = false
        return button
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = .backgroundColor
        searchBar.barTintColor = .backgroundColor
        searchBar.layer.masksToBounds = false
        searchBar.placeholder = "Поиск продуктов"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = .mediumSystemFontOfSize(size: 14)
        searchBar.searchTextField.layer.cornerRadius = 12
        searchBar.searchTextField.layer.backgroundColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.12).cgColor
        searchBar.searchTextField.layer.shadowOffset = CGSize(width: 2, height: 2)
        searchBar.searchTextField.layer.shadowRadius = 4.0
        searchBar.searchTextField.layer.shadowOpacity = 1.0
        searchBar.setImage(UIImage(named: "SearchIcon"), for: UISearchBar.Icon.search, state: [])
        return searchBar
    }()
    
    lazy var searchBarShadow: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: -2, height: -2)
        return layer
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        return view
    }()
    
    lazy var subCategoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .clear
        collectionView.layer.masksToBounds = false
        return collectionView
    }()
    
    lazy var productCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var activityIndicationView: UIActivityIndicatorView = {
        let activityIndicationView = UIActivityIndicatorView(style: .medium)
        activityIndicationView.color = .white
        activityIndicationView.backgroundColor = .darkGray
        activityIndicationView.layer.cornerRadius = 5.0
        activityIndicationView.hidesWhenStopped = true
        return activityIndicationView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        searchBarShadow.frame = searchBar.searchTextField.bounds
    }
    
    private func addSubviews() {
        [backButton,
         searchBar,
         categoryLabel,
         dividerView,
         subCategoryCollectionView,
         productCollectionView,
         activityIndicationView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelHeight: CGFloat = 24
        
        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 14),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 36), //По дизайну кнопка 40х40, но searchTextField высотой 36, поэтому пока сделал 36
            backButton.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        let searchBarConstraints = [
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11),
            searchBar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            searchBar.heightAnchor.constraint(equalToConstant: 42)
        ]
        
        let categoryLabelConstraints = [
            categoryLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 28),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            categoryLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let dividerViewConstraints = [
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dividerView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            dividerView.heightAnchor.constraint(equalToConstant: 3)
        ]
        
        let subCategoryCollectionViewConstraints = [
            subCategoryCollectionView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 8),
            subCategoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subCategoryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subCategoryCollectionView.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let productCollectionViewConstraints = [
            productCollectionView.topAnchor.constraint(equalTo: subCategoryCollectionView.bottomAnchor, constant: 11),
            productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let activityIndicatorViewConstraints = [
            activityIndicationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicationView.heightAnchor.constraint(equalToConstant: 50),
            activityIndicationView.widthAnchor.constraint(equalToConstant: 50.0)
        ]
        
        [backButtonConstraints,
         searchBarConstraints,
         categoryLabelConstraints,
         dividerViewConstraints,
         subCategoryCollectionViewConstraints,
         productCollectionViewConstraints,
         activityIndicatorViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
    func startLoading() {
        activityIndicationView.isHidden = false
        activityIndicationView.startAnimating()
    }
    
    func finishLoading() {
        activityIndicationView.stopAnimating()
    }
}

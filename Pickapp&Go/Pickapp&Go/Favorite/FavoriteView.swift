//
//  FavoriteView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class FavoriteView: UIView {
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Избранное"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var productCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.backgroundColor = .clear
        return collectionView
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
        [backButton,
         titleLabel,
         productCollectionView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelHeight = 24.f
        
        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 14),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 26),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let productCollectionViewConstraints = [
            productCollectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        [backButtonConstraints,
         titleLabelConstraints,
         productCollectionViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

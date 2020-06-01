//
//  OrderEndView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class OrderEndView: UIView, UIScrollViewDelegate {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 20)
        label.numberOfLines = 1
        label.text = "Спасибо за заказ"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 12)
        label.numberOfLines = 1
        label.text = "№123 324 от 12.07.22"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var followButton: AddToCartButton = {
        let button = AddToCartButton()
        button.setTitle("Отследить", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .backgroundColor
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [titleLabel,
         orderLabel,
         followButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let orderLabelConstraints = [
            orderLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            orderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            orderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            orderLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let followButtonConstraints = [
            followButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            followButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            followButton.widthAnchor.constraint(equalToConstant: 201),
            followButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        [titleLabelConstraints,
         orderLabelConstraints,
         followButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

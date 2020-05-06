//
//  ShopLabel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ShopLabel: UIView {
    let titleFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    let subtitleFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    var titleText = ""
    var subtitleText = ""
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "ShopIcon")
        imageView.image = image
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = titleFont
        label.text = titleText
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = subtitleFont
        label.text = subtitleText
        label.textAlignment = .left
        label.textColor = .placeholderColor
        return label
    }()
    
    convenience init(title: String, subtitle: String) {
        self.init()
        self.titleText = title
        self.subtitleText = subtitle
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        [icon, titleLabel, subtitleLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let iconConstraints = [
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 24),
            icon.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let subtitleLabelConstraints = [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ]

        [iconConstraints,
         titleLabelConstraints,
         subtitleLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

//
//  ProductCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    var viewModel: ProductCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "LikeNotactiveIcon"), for: .normal)
        button.setImage(UIImage(named: "LikeActiveIcon"), for: .selected)
        return button
    }()
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ShopIcon")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var cartButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "CartIconBlack"), for: .normal)
        return button
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1)
        layer.cornerRadius = 8
        addSubiews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubiews() {
        let subviews = [likeButton, image, label, descriptionLabel, cartButton, priceLabel]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            likeButton.widthAnchor.constraint(equalToConstant: 24),
            likeButton.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let imageConstraints = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 68),
            image.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let cartButtonConstraints = [
            cartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            cartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            cartButton.widthAnchor.constraint(equalToConstant: 24),
            cartButton.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let priceLabelConstraints = [
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            priceLabel.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -12),
            priceLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [likeButtonConstraints,
         imageConstraints,
         labelConstraints,
         descriptionLabelConstraints,
         cartButtonConstraints,
         priceLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpViewModel() {
        let price = String(format: "%.2f", arguments: [viewModel.product.price])
        label.text = viewModel.product.title
        image.image = UIImage(named: viewModel.product.image)
        descriptionLabel.text = viewModel.product.description
        priceLabel.text = "\(price) руб."
    }
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected = !likeButton.isSelected
    }
    
}

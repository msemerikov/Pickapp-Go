//
//  CartTableViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"
    
    var viewModel: CartCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 14)
        label.textAlignment = .left
        label.textColor = .labelColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.textAlignment = .center
        label.textColor = .labelColor
        label.numberOfLines = 1
        return label
    }()
    
    lazy var shadow: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 14
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: -2, height: -2)
        return layer
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubiews()
        setUpConstraints()
        updateLayerProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        shadow.frame = bounds
    }
    
    private func addSubiews() {
        let subviews = [productImage, productNameLabel, priceLabel]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        
        let productImageConstraints = [
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImage.widthAnchor.constraint(equalToConstant: 36),
            productImage.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let productNameLabelConstraints = [
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productNameLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            productNameLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let priceLabelConstraints = [
            priceLabel.widthAnchor.constraint(equalToConstant: 48),
            priceLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [productImageConstraints,
         productNameLabelConstraints,
         priceLabelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    // TODO: - Add second shadow
    private func updateLayerProperties() {
        layer.cornerRadius = 14
        layer.shadowColor = UIColor(red: 0.06, green: 0.21, blue: 0.596, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1.0
        layer.insertSublayer(shadow, at: 0)
    }
    
    private func setUpViewModel() {
        let price = String(format: "%.0f", arguments: [viewModel.item.amount])
        productImage.image = UIImage(named: viewModel.item.product.image ?? "NoImage")
        productNameLabel.text = viewModel.item.product.title
        priceLabel.text = "\(price) ₽"
    }
    
}

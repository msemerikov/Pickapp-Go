//
//  ProductCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

protocol ItemsInCartDelegate: AnyObject {
    func increaseBadge()
}

final class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    private var imageTopAnchorConstraint: NSLayoutConstraint?
    weak var delegate: ItemsInCartDelegate?
    
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
        imageView.contentMode = .scaleAspectFit
//        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 12)
        label.textAlignment = .center
        label.textColor = .labelColor
        label.numberOfLines = 0
//        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return label
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        return view
    }()
    /*
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    */
    lazy var cartButton: CartButton = {
        let button = CartButton()
        button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 10)
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var shadow: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: -2, height: -2)
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        let subviews = [likeButton, image, label, /*descriptionLabel,*/ dividerView, cartButton, priceLabel]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let imageTopAnchor = (frame.height - 51 - 80 - 32 - 4) / 2
        imageTopAnchorConstraint = image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: imageTopAnchor)
        imageTopAnchorConstraint?.isActive = true
        
        let likeButtonConstraints = [
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            likeButton.widthAnchor.constraint(equalToConstant: 48),
            likeButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let dividerViewConstraints = [
            dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            dividerView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -51),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let imageConstraints = [
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 32)
        ]
        
        /*
        let descriptionLabelConstraints = [
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        */
        
        let cartButtonConstraints = [
            cartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            cartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
            cartButton.widthAnchor.constraint(equalToConstant: 34),
            cartButton.heightAnchor.constraint(equalToConstant: 34)
        ]
        
        let priceLabelConstraints = [
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            priceLabel.centerYAnchor.constraint(equalTo: cartButton.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [likeButtonConstraints,
         dividerViewConstraints,
         imageConstraints,
         labelConstraints,
         cartButtonConstraints,
         priceLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    // TODO: - Add second shadow
    private func updateLayerProperties() {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1.0
        layer.insertSublayer(shadow, at: 0)
    }
    
    private func setUpViewModel() {
        let price = String(format: "%.2f", arguments: [viewModel.product.price])
        let unit = " / \(viewModel.product.unit)"
        
        let index = price.firstIndex(of: ".") ?? price.endIndex
        let newString = String(price[...index])
        let range = (price as NSString).range(of: newString)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFontOfSize(size: 8)]
        let firstString = NSMutableAttributedString(string: price)
        let secondString = NSMutableAttributedString(string: unit, attributes: attributes)
        
        firstString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFontOfSize(size: 14), range: range)
        firstString.append(secondString)
        label.text = viewModel.product.title
        image.image = UIImage(named: viewModel.product.image)
        priceLabel.attributedText = firstString
        likeButton.isSelected = viewModel.product.isFavorite
        
        imageTopAnchorConstraint?.isActive = false
        let imageTopAnchor = (frame.height - 51 - 80 - 32 - 4) / 2
        imageTopAnchorConstraint = image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: imageTopAnchor)
        imageTopAnchorConstraint?.isActive = true
    }
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected = !likeButton.isSelected
        viewModel.product.isFavorite = likeButton.isSelected
    }
    
    @objc private func cartButtonTapped() {
        cartArray.append(CartItem(product: viewModel.product, count: 1, price: viewModel.product.price))
        totalItemsInCart += 1
        delegate?.increaseBadge()
    }
    
}

extension UITabBarController {
    func increaseBadge(indexOfTab: Int, num: String) {
        let tabItem = tabBar.items![indexOfTab]
        tabItem.badgeValue = num
    }
    
    func hideBadge(indexOfTab: Int) {
        let tabItem = tabBar.items![indexOfTab]
        tabItem.badgeValue = nil
    }
}

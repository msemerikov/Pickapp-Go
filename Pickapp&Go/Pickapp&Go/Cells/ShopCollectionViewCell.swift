//
//  ShopCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 23.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class ShopCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShopCollectionViewCell"
    
    var viewModel: ShopCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var shopLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    /*
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 30)
        label.textAlignment = .center
        label.textColor = .titleColor
        return label
    }()
    */
    lazy var locationView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 4.0
        return stackView
    }()
    
    lazy var locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LocationIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return imageView
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.textAlignment = .left
        label.textColor = .labelColor
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 18
        addSubiews()
        setUpConstraints()
        updateLayerProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubiews() {
        let subviews = [shopLogoImage, locationView]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        locationView.addArrangedSubview(locationIcon)
        locationView.addArrangedSubview(locationLabel)
    }
    
    private func setUpConstraints() {
        let shopLogoImageConstraints = [
            shopLogoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            shopLogoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shopLogoImage.heightAnchor.constraint(equalToConstant: 66)
        ]
        
        /*
        let titleConstraints = [
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            title.heightAnchor.constraint(equalToConstant: 30)
        ]
        */
        let locationViewConstraints = [
            locationView.topAnchor.constraint(equalTo: shopLogoImage.bottomAnchor, constant: 12),
            locationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            locationView.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [shopLogoImageConstraints,
         locationViewConstraints,
            ].forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func updateLayerProperties() {
        layer.cornerRadius = 18
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 12.0
        layer.shadowOpacity = 1.0
    }
    
    private func setUpViewModel() {
        shopLogoImage.image = UIImage(named: viewModel.shop.image)
        locationLabel.text = viewModel.shop.address
    }
    
}

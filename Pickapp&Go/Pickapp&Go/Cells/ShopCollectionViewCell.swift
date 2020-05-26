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
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 30)
        label.textAlignment = .center
        label.textColor = .titleColor
        return label
    }()
    
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
        label.font = .mediumSystemFontOfSize(size: 14)
        label.textAlignment = .left
        label.textColor = .labelColor
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return label
    }()
    
    lazy var ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rating")
        return imageView
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
        let subviews = [title, locationView, ratingImage]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        locationView.addArrangedSubview(locationIcon)
        locationView.addArrangedSubview(locationLabel)
    }
    
    private func setUpConstraints() {
        let titleConstraints = [
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            title.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let locationViewConstraints = [
            locationView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            locationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            locationView.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let ratingImageConstraints = [
            ratingImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ratingImage.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            ratingImage.widthAnchor.constraint(equalToConstant: 141),
            ratingImage.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [titleConstraints,
         locationViewConstraints,
         ratingImageConstraints
            ].forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func updateLayerProperties() {
        layer.cornerRadius = 18
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 12.0
        layer.shadowOpacity = 1.0
    }
    
    private func setUpViewModel() {
        title.text = viewModel.shop.title
        locationLabel.text = viewModel.shop.address
    }
    
}

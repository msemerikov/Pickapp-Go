//
//  CategoryCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    var viewModel: CategoryCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ShopIcon")
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
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
        let subviews = [image, label]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
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
        
        [imageConstraints, labelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpViewModel() {
        label.text = viewModel.categoryTitle
    }
    
}

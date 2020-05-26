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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.textAlignment = .center
        label.textColor = .labelColor
        label.numberOfLines = 2
        return label
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
    
    private func addSubiews() {
        let subviews = [image, label]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let imageConstraints = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 32)
        ]
        
        [imageConstraints, labelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    // TODO: - Add second shadow
    private func updateLayerProperties() {
        layer.cornerRadius = 16
        layer.shadowColor = UIColor(red: 0.06, green: 0.21, blue: 0.596, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
    }
    
    private func setUpViewModel() {
        label.text = viewModel.category.title
        image.image = UIImage(named: viewModel.category.image)
    }
    
}

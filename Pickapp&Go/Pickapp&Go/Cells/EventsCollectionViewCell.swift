//
//  EventsCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class EventsCollectionViewCell: UICollectionViewCell {
    static let identifier = "EventsCollectionViewCell"
    
    var viewModel: EventsCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .appLightGrayColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .enabledButtonBackgroundColor
        layer.cornerRadius = 12
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
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        let labelConstraints = [
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            label.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [imageConstraints, labelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpViewModel() {
        label.text = viewModel.event.title
        image.image = UIImage(named: viewModel.event.image)
    }
    
}

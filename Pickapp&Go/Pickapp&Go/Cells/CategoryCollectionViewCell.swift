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
//    private var bindings = Set<AnyCancellable>()
    
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
    
    lazy var shadow: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 6
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
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
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
        layer.insertSublayer(shadow, at: 0)
    }
    
//    func configure(with viewModel: CategoryCellViewModel) {
//        label.text = viewModel.title
//        image.image = viewModel.image
//    }
    
    
    private func setUpViewModel() {
        label.text = viewModel.title
        image.image = viewModel.image

//        viewModel.$urlImage
//            .receive(on: RunLoop.main)
//            .sink { value in
//                guard let url = value else { return }
//                self.image.downloaded(from: url)
//            }
//        .store(in: &bindings)
    }
    
//    override func prepareForReuse() {
//        label.text = ""
//        image.image = nil
//    }
     
}

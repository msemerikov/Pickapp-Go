//
//  SubcategoryCollectionViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class SubcategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "SubcategoryCollectionViewCell"
    
    var viewModel: SubcategoryCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.textAlignment = .center
        label.textColor = .labelColor
        label.numberOfLines = 1
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
    
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? UIColor.vividOrange : UIColor.labelColor
        }
    }
    
    private func addSubiews() {
        let subviews = [label]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        [labelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    // TODO: - Add second shadow
    private func updateLayerProperties() {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor(red: 0.06, green: 0.21, blue: 0.596, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
    }
    
    private func setUpViewModel() {
        label.text = viewModel.subcategory.title
    }
    
    func toggleSelected() {
        if isSelected {
            label.textColor = UIColor.vividOrange
        } else {
            label.textColor = UIColor.labelColor
        }
    }
    
}

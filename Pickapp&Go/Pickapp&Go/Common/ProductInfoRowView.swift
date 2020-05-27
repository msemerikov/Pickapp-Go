//
//  ProductInfoRowView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ProductInfoRowView: UIView {
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = .lightSystemFontOfSize(size: 11)
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 11)
        label.textAlignment = .right
        label.textColor = .labelColor
        return label
    }()
    
    lazy var dividerView: DividerView = {
        let view = DividerView()
        return view
    }()
    
    init(leftLabel: String, rightLabel: String, withLine: Bool) {
        super.init(frame: .zero)
        self.leftLabel.text = leftLabel
        self.rightLabel.text = rightLabel
        if !withLine {
            self.dividerView.layer.borderColor = UIColor.clear.cgColor
        }
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [leftLabel, rightLabel, dividerView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let leftLabelConstraints = [
            leftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            leftLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ]
        
        let rightLabelConstraints = [
            rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rightLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            rightLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        ]
        
        let dividerViewConstraints = [
            dividerView.topAnchor.constraint(equalTo: self.topAnchor),
            dividerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        [leftLabelConstraints,
         rightLabelConstraints,
         dividerViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

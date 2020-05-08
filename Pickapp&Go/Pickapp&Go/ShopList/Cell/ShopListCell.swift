//
//  ShopListCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class ShopListCell: UITableViewCell {
    static let identifier = "ShopListCell"
    
    var viewModel: ShopListCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var shopLogoImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .labelColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubiews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubiews() {
        let subviews = [shopLogoImage, label]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let shopLogoImageConstraints = [
            shopLogoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            shopLogoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shopLogoImage.widthAnchor.constraint(equalToConstant: 84),
            shopLogoImage.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: shopLogoImage.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        [shopLogoImageConstraints, labelConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpViewModel() {
        label.text = viewModel.shop.title
        shopLogoImage.image = UIImage(named: viewModel.shop.image)
//        playerNameLabel.text = viewModel.playerName
//        teamLabel.text = viewModel.team
        
        // accessing PropertyWrapper does not work here
        //        viewModel.$playerName.assign(to: \.text, on: playerNameLabel)
        //        viewModel.$team.assign(to: \.text, on: teamLabel)
    }
}

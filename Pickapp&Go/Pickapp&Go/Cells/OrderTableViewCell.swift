//
//  OrderTableViewCell.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class OrderTableViewCell: UITableViewCell {
    static let identifier = "OrderTableViewCell"
    
    var viewModel: OrderCellViewModel! {
        didSet {
            setUpViewModel()
        }
    }
    
    lazy var shopLogoImage: ShopLogoImage = {
        let imageView = ShopLogoImage(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
      
    lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var statusImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var divider = DividerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundColor
        addSubiews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubiews() {
        let subviews = [shopLogoImage,
                        orderLabel,
                        statusLabel,
                        statusImage,
                        priceLabel,
                        divider]
        
        subviews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        
        let shopLogoImageConstraints = [
            shopLogoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            shopLogoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            shopLogoImage.widthAnchor.constraint(equalToConstant: 48),
            shopLogoImage.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let orderLabelConstraints = [
            orderLabel.leadingAnchor.constraint(equalTo: shopLogoImage.trailingAnchor, constant: 16),
            orderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            orderLabel.widthAnchor.constraint(equalToConstant: 170),
            orderLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let statusLabelConstraints = [
            statusLabel.leadingAnchor.constraint(equalTo: shopLogoImage.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 4),
            statusLabel.widthAnchor.constraint(equalToConstant: 148),
            statusLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let statusImageConstraints = [
            statusImage.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusImage.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            statusImage.widthAnchor.constraint(equalToConstant: 12),
            statusImage.heightAnchor.constraint(equalToConstant: 12)
        ]
        
        let priceLabelConstraints = [
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            priceLabel.centerYAnchor.constraint(equalTo: orderLabel.centerYAnchor),
//            priceLabel.widthAnchor.constraint(equalToConstant: 90),
            priceLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let dividerConstraints = [
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        [shopLogoImageConstraints,
         orderLabelConstraints,
         statusLabelConstraints,
         statusImageConstraints,
         priceLabelConstraints,
         dividerConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    private func setUpViewModel() {
        let price = String(format: "%.2f", arguments: [viewModel.order.price])
        shopLogoImage.image = UIImage(named: viewModel.order.shop.logo)
        orderLabel.text = "№\(viewModel.order.id) от \(viewModel.order.date)"
        statusLabel.text = viewModel.order.status
        priceLabel.text = "\(price) ₽"
        switch viewModel.order.status {
        case "Заказ получен":
            statusImage.image = UIImage(named: "Mark")
        case "Заказ отменен":
            statusImage.image = UIImage(named: "СancelOrder")
        case "Оформляется":
            statusImage.image = UIImage(named: "Clock")
        default:
            statusImage.image = nil
        }
    }
    
}

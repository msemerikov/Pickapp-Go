//
//  OrderView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class OrderView: UIView, UIScrollViewDelegate {
    
    var productTableViewHeightConstraint: NSLayoutConstraint?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Ваш заказ"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var shopLogoImage: ShopLogoImage = {
        let imageView = ShopLogoImage(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
      
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var statusImage: ShopLogoImage = {
        let imageView = ShopLogoImage(frame: .zero)
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 14)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .labelColor
        return label
    }()
    
    lazy var divider: DividerView = {
        let divider = DividerView()
        divider.backgroundColor = .white
        return divider
    }()
    
    lazy var structureLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Состав заказа"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var productTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.layer.masksToBounds = false
        return tableView
    }()
    
    lazy var changedLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Товар был заменен"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var changedProductTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.layer.masksToBounds = false
        return tableView
    }()
    
    lazy var deletedLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "Товара не оказалось в наличии"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var deletedProductTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.layer.masksToBounds = false
        return tableView
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.text = "Сумма заказа"
        label.textAlignment = .left
        label.textColor = .labelColor
        return label
    }()
    
    lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFontOfSize(size: 16)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .labelColor
        return label
    }()
    
    lazy var sendButton: AddToCartButton = {
        let button = AddToCartButton()
        button.setTitle("Повторить заказ", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .backgroundColor
        addScrollView()
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        [backButton,
         titleLabel,
         shopLogoImage,
         numberLabel,
         dateLabel,
         statusImage,
         statusLabel,
         divider,
         structureLabel,
         productTableView,
         changedLabel,
         changedProductTableView,
         deletedLabel,
         deletedProductTableView,
         totalLabel,
         totalValueLabel,
         sendButton]
            .forEach {
                scrollView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let shopLogoImageConstraints = [
            shopLogoImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
            shopLogoImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            shopLogoImage.widthAnchor.constraint(equalToConstant: 48),
            shopLogoImage.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let numberLabelConstraints = [
            numberLabel.topAnchor.constraint(equalTo: shopLogoImage.topAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: shopLogoImage.trailingAnchor, constant: 12),
            numberLabel.widthAnchor.constraint(equalToConstant: 140),
            numberLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let dateLabelConstraints = [
            dateLabel.bottomAnchor.constraint(equalTo: shopLogoImage.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: shopLogoImage.trailingAnchor, constant: 12),
            dateLabel.widthAnchor.constraint(equalToConstant: 92),
            dateLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let statusImageConstraints = [
            statusImage.topAnchor.constraint(equalTo: shopLogoImage.topAnchor),
            statusImage.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            statusImage.widthAnchor.constraint(equalToConstant: 24),
            statusImage.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let statusLabelConstraints = [
            statusLabel.bottomAnchor.constraint(equalTo: shopLogoImage.bottomAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            statusLabel.widthAnchor.constraint(equalToConstant: 132),
            statusLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let dividerConstraints = [
            divider.topAnchor.constraint(equalTo: shopLogoImage.bottomAnchor, constant: 9),
            divider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            divider.heightAnchor.constraint(equalToConstant: 3)
        ]
        
        let structureLabelConstraints = [
            structureLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 24),
            structureLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            structureLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            structureLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let productTableViewConstraints = [
            productTableView.topAnchor.constraint(equalTo: structureLabel.bottomAnchor, constant: 8),
            productTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            productTableView.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16)
        ]
        
        let changedLabelConstraints = [
            changedLabel.topAnchor.constraint(equalTo: productTableView.bottomAnchor, constant: 24),
            changedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            changedLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            changedLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let changedProductTableViewConstraints = [
            changedProductTableView.topAnchor.constraint(equalTo: changedLabel.bottomAnchor, constant: 8),
            changedProductTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            changedProductTableView.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16)
        ]
        
        let deletedLabelConstraints = [
            deletedLabel.topAnchor.constraint(equalTo: changedProductTableView.bottomAnchor, constant: 24),
            deletedLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            deletedLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            deletedLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let deletedProductTableViewConstraints = [
            deletedProductTableView.topAnchor.constraint(equalTo: deletedLabel.bottomAnchor, constant: 8),
            deletedProductTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            deletedProductTableView.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16)
        ]
        
        let totalLabelConstraints = [
            totalLabel.topAnchor.constraint(equalTo: deletedProductTableView.bottomAnchor, constant: 24),
            totalLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let totalValueLabelConstraints = [
            totalValueLabel.topAnchor.constraint(equalTo: deletedProductTableView.bottomAnchor, constant: 24),
            totalValueLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width / 2),
            totalValueLabel.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Session.width - 16),
            totalValueLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        let sendButtonConstraints = [
            sendButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 24),
            sendButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 201),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        [scrollViewConstraints,
         backButtonConstraints,
         titleLabelConstraints,
         shopLogoImageConstraints,
         numberLabelConstraints,
         dateLabelConstraints,
         statusImageConstraints,
         statusLabelConstraints,
         dividerConstraints,
         structureLabelConstraints,
         productTableViewConstraints,
         changedLabelConstraints,
         changedProductTableViewConstraints,
         deletedLabelConstraints,
         deletedProductTableViewConstraints,
         totalLabelConstraints,
         totalValueLabelConstraints,
         sendButtonConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}

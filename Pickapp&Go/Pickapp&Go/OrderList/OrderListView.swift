//
//  OrderListView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class OrderListView: UIView, UIScrollViewDelegate {
    
    lazy var backButton: BackButton = {
        let button = BackButton()
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFontOfSize(size: 18)
        label.numberOfLines = 1
        label.text = "История заказов"
        label.textAlignment = .center
        label.textColor = .labelColor
        return label
    }()
    
    lazy var orderTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.layer.masksToBounds = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [backButton,
         titleLabel,
         orderTableView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let labelHeight = 24.f

        let backButtonConstraints = [
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ]
        
        let orderTableViewConstraints = [
            orderTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32),
            orderTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            orderTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            orderTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        [backButtonConstraints,
         titleLabelConstraints,
         orderTableViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}


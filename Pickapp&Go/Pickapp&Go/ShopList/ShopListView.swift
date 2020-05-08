//
//  ShopListView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class ShopListView: UIView {
    
    lazy var shopListView: UITableView = {
        let tableView = UITableView()
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
        [shopListView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        
        let shopListViewConstraints = [
            shopListView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shopListView.topAnchor.constraint(equalTo: topAnchor),
            shopListView.heightAnchor.constraint(equalTo: heightAnchor),
            shopListView.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        [shopListViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
}

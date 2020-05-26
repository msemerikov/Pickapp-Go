//
//  CategoryListView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

final class CategoryListView: UIView {
    
    lazy var tableView: UITableView = {
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
        [tableView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        
        let shopListViewConstraints = [
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor),
            tableView.widthAnchor.constraint(equalToConstant: Session.width)
        ]
        
        [shopListViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
        
    }
    
}

//
//  OrderListViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class OrderListViewController: UIViewController {
    private lazy var contentView = OrderListView()
    private let viewModel: OrderListViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: OrderListViewModel = OrderListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupCollectionsView()
        setUpTargets()
        setUpBindings()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        viewModel.loadProduct()
    }
    
    private func setupCollectionsView() {
        contentView.orderTableView.register(OrderTableViewCell.self, forCellReuseIdentifier: OrderTableViewCell.identifier)
        contentView.orderTableView.dataSource = self
        contentView.orderTableView.delegate = self
        contentView.orderTableView.tableFooterView = UIView()
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
//            let viewModelsValueHandler: ([CartCellViewModel]) -> Void = { [weak self] _ in
//                self?.contentView.productTableView.reloadData()
//            }
//
//            viewModel.$productInCartViewModels
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: viewModelsValueHandler)
//                .store(in: &bindings)
            
//            let viewModelsValueHandler: ([ProductCellViewModel]) -> Void = { [weak self] _ in
//                self?.contentView.productCollectionView.reloadData()
//            }
            
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func placeOrder() {
        let viewController = PlaceOrderViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension OrderListViewController: ItemsInCartDelegate {
    
    func increaseBadge() {
        self.tabBarController?.increaseBadge(indexOfTab: 3, num: totalItemsInCart.description)
    }
    
}

// MARK: - UITableViewDelegate
extension OrderListViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.ordersViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let order = indexPath.section
        let viewController = OrderViewController(order: viewModel.ordersViewModels[order].order)
        navigationController?.pushViewController(viewController, animated: true)
    }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        guard let cell = tableView.cellForRow(at: indexPath) else { return }
    //        cell.isSelected = false
        }
    
}

// MARK: - UITableViewDataSource
extension OrderListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? OrderTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.ordersViewModels[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}

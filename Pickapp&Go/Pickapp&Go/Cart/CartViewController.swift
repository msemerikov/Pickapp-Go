//
//  CartViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class CartViewController: UIViewController {
    private lazy var contentView = CartView()
    private let viewModel: CartViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: CartViewModel = CartViewModel()) {
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
        contentView.totalValueLabel.text = "\(String(format: "%.0f", arguments: [viewModel.totalValue])) ₽"
        contentView.tableViewHeightConstraint?.isActive = false
        contentView.tableViewHeightConstraint = contentView.productTableView.heightAnchor.constraint(equalToConstant: viewModel.productInCartViewModels.count.f * (56 + 12))
        contentView.tableViewHeightConstraint?.isActive = true
        contentView.recommendedCollectionView.reloadData()
        contentView.productTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setupCollectionsView() {
        contentView.productTableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        contentView.productTableView.dataSource = self
        contentView.productTableView.delegate = self
        
        contentView.recommendedCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.recommendedCollectionView.dataSource = self
        contentView.recommendedCollectionView.delegate = self
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        contentView.addToCartButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            let viewModelsValueHandler: ([CartCellViewModel]) -> Void = { [weak self] _ in
                self?.contentView.productTableView.reloadData()
            }
            
            viewModel.$productInCartViewModels
                .receive(on: RunLoop.main)
                .sink(receiveValue: viewModelsValueHandler)
                .store(in: &bindings)
            
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

extension CartViewController: ItemsInCartDelegate {
    
    func increaseBadge() {
        self.tabBarController?.increaseBadge(indexOfTab: 3, num: totalItemsInCart.description)
    }
    
}

extension CartViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = indexPath.item
        let viewController = ProductViewController(product: viewModel.recommendedViewModels[product].product)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension CartViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recommendedViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductCollectionViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.recommendedViewModels[indexPath.item]
        cell.delegate = self
        cell.layoutSubviews()
        return cell
    }
    
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 204)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
}

// MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.productInCartViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? CartTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.productInCartViewModels[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = indexPath.section
        let viewController = ProductViewController(product: viewModel.productInCartViewModels[product].item.product)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.isSelected = false
    }

}

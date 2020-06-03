//
//  OrderViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class OrderViewController: UIViewController {
    private lazy var contentView = OrderView()
    private let viewModel: OrderViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: OrderViewModel = OrderViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: OrderViewModel = OrderViewModel(), order: Order) {
        self.init(viewModel: viewModel)
        viewModel.order = order
        loadData(order)
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
        viewModel.loadProduct()
        setupViews()
        setUpTargets()
        setUpBindings()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setupViews() {
        contentView.productTableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        contentView.productTableView.dataSource = self
        contentView.productTableView.delegate = self
        
        contentView.productTableViewHeightConstraint?.isActive = false
        contentView.productTableViewHeightConstraint = contentView.productTableView.heightAnchor.constraint(equalToConstant: viewModel.productsViewModels.count.f * (56 + 12))
        contentView.productTableViewHeightConstraint?.isActive = true
        
//        contentView.recommendedCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
//        contentView.recommendedCollectionView.dataSource = self
//        contentView.recommendedCollectionView.delegate = self
    }
    
    private func loadData(_ order: Order) {
        guard let order = viewModel.order else { return }
        contentView.totalValueLabel.text = "\(String(format: "%.2f", arguments: [order.price])) ₽"
        contentView.shopLogoImage.image = UIImage(named: order.shop.logo)
        contentView.numberLabel.text = "№ \(order.id)"
        contentView.dateLabel.text = order.date
        contentView.statusLabel.text = order.status
        
        switch order.status {
        case "Заказ получен":
            contentView.statusImage.image = UIImage(named: "Mark")
        case "Заказ отменен":
            contentView.statusImage.image = UIImage(named: "СancelOrder")
        case "Оформляется":
            contentView.statusImage.image = UIImage(named: "Clock")
        default:
            contentView.statusImage.image = nil
        }
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
//        contentView.addToCartButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
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

// MARK: - UITableViewDelegate
extension OrderViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.productsViewModels.count
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
extension OrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? CartTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.productsViewModels[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = indexPath.section
        let viewController = ProductViewController(product: viewModel.productsViewModels[product].item.product)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.isSelected = false
    }

}


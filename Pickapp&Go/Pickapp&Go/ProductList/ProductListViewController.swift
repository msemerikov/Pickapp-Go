//
//  ProductListViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class ProductListViewController: UIViewController {
    private lazy var contentView = ProductListView()
    private let viewModel: ProductListViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: ProductListViewModel = ProductListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: ProductListViewModel = ProductListViewModel(), title: String, products: [Product]) {
        self.init(viewModel: viewModel)
        viewModel.products = products
        contentView.categoryLabel.text = title
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
        viewModel.loadProduct()
//        setUpBindings()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        contentView.productCollectionView.reloadData()
    }
    
    func reload() {
        contentView.productCollectionView.reloadData()
    }
    
    private func setupCollectionsView() {
        contentView.productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.productCollectionView.dataSource = self
        contentView.productCollectionView.delegate = self
        
        let layout = ProductCollectionViewLayout()
        layout.delegate = self
        contentView.productCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.subCategoryCollectionView.indexPath(for: <#T##UICollectionViewCell#>)
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            let viewModelsValueHandler: ([ProductCellViewModel]) -> Void = { [weak self] _ in
                self?.contentView.productCollectionView.reloadData()
            }
            
            viewModel.$productViewModels
                .receive(on: RunLoop.main)
                .sink(receiveValue: viewModelsValueHandler)
                .store(in: &bindings)
            
            bindViewToViewModel()
            bindViewModelToView()
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProductListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = indexPath.item
        let viewController = ProductViewController(product: viewModel.productViewModels[product].product)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ProductListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.productViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductCollectionViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.productViewModels[indexPath.item]
        cell.layoutSubviews()
        return cell
    }
    
}
/*
extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contentView.subCategoryCollectionView {
            return CGSize(width: 97, height: 32)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
*/
extension ProductListViewController: ProductCollectionViewLayoutDelegate {
    
    func height(forItemAt indexPath: IndexPath) -> CGFloat {
        if viewModel.productViewModels.count < 4 {
            return 204
        } else {
            if indexPath.item == 0 || indexPath.item == viewModel.productViewModels.count - 2 {
                return 316
            } else {
                return 204
            }
        }
    }

    func width(forItemAt indexPath: IndexPath) -> CGFloat {
        return (Session.width - 48) / 2
    }
    
}


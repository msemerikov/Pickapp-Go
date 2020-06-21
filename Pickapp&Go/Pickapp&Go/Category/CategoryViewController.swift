//
//  CategoryViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class CategoryViewController: UIViewController {
    private lazy var contentView = CategoryView()
    private let viewModel: CategoryViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: CategoryViewModel = CategoryViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: CategoryViewModel = CategoryViewModel(), category: Category) {
        self.init(viewModel: viewModel)
        contentView.categoryLabel.text = category.title
        viewModel.loadCategories(with: category.id)
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
    }
    
    func reload() {
        contentView.productCollectionView.reloadData()
    }
    
    private func setupCollectionsView() {
        contentView.subCategoryCollectionView.register(SubcategoryCollectionViewCell.self, forCellWithReuseIdentifier: SubcategoryCollectionViewCell.identifier)
        contentView.subCategoryCollectionView.dataSource = self
        contentView.subCategoryCollectionView.delegate = self
    
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

        }
        
        func bindViewModelToView() {
            
            let viewModelsValueHandler: ([SubcategoryCellViewModel]) -> Void = { [weak self] _ in
                self?.contentView.subCategoryCollectionView.reloadData()
            }
            
            viewModel.$subcategoryViewModels
                .receive(on: RunLoop.main)
                .sink(receiveValue: viewModelsValueHandler)
                .store(in: &bindings)
            
            let viewModelsValueHandlerProduct: ([ProductCellViewModel]) -> Void = { [weak self] _ in
                self?.contentView.productCollectionView.reloadData()
            }
            
            viewModel.$productViewModels
                .receive(on: RunLoop.main)
                .sink(receiveValue: viewModelsValueHandlerProduct)
                .store(in: &bindings)
            
            let stateValueHandler: (ListViewModelState) -> Void = { [weak self] state in
                switch state {
                case .loading:
                    self?.contentView.startLoading()
                case .finishedLoading:
                    self?.contentView.finishLoading()
                case .error(let error):
                    self?.contentView.finishLoading()
                    self?.showError(error)
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateValueHandler)
                .store(in: &bindings)
            
            }
            bindViewToViewModel()
            bindViewModelToView()
    }
    
    private func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.subCategoryCollectionView {
            collectionView.allowsMultipleSelection = true
            viewModel.addSubcategory(indexPath.item)
            contentView.productCollectionView.reloadData()
        } else {
            let product = indexPath.item
            let viewController = ProductViewController(product: viewModel.productViewModels[product].product)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == contentView.subCategoryCollectionView {
            viewModel.removeSubcategory(indexPath.item)
            if collectionView.indexPathsForSelectedItems?.count == 0 {
                viewModel.noFilterCategory()
            }
            contentView.productCollectionView.reloadData()
        }
    }
    
}

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.subCategoryCollectionView {
            return viewModel.subcategoryViewModels.count
        } else if collectionView == contentView.productCollectionView {
            return viewModel.productViewModels.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.subCategoryCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? SubcategoryCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.subcategoryViewModels[indexPath.item]
            return cell
        } else if collectionView == contentView.productCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? ProductCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.productViewModels[indexPath.item]
            cell.layoutSubviews()
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
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

extension CategoryViewController: ProductCollectionViewLayoutDelegate {
    
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

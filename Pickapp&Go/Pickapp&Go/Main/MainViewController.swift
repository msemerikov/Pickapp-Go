//
//  MainViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class MainViewController: UIViewController {
    private lazy var contentView = MainView()
    private let viewModel: MainViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: MainViewModel = MainViewModel()) {
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
//        setUpBindings()
//        viewModel.startTimer()
        viewModel.loadCategory()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        reloadCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setupCollectionsView() {
        contentView.shopCollectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
        contentView.shopCollectionView.dataSource = self
        contentView.shopCollectionView.delegate = self
    
        contentView.categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        contentView.categoryCollectionView.dataSource = self
        contentView.categoryCollectionView.delegate = self
    
        contentView.buyerChoiceCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.buyerChoiceCollectionView.dataSource = self
        contentView.buyerChoiceCollectionView.delegate = self
    
        contentView.newProductCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.newProductCollectionView.dataSource = self
        contentView.newProductCollectionView.delegate = self
    
        contentView.salesCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.salesCollectionView.dataSource = self
        contentView.salesCollectionView.delegate = self
    }
    
    private func reloadCollectionView() {
        contentView.categoryCollectionView.reloadData()
        contentView.buyerChoiceCollectionView.reloadData()
        contentView.newProductCollectionView.reloadData()
        contentView.salesCollectionView.reloadData()
    }
    
    private func setUpTargets() {
        contentView.allCategoryButton.addTarget(self, action: #selector(allCategoryButtonTapped), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
//            viewModel.validatedPhone
//                .receive(on: RunLoop.main)
//                .assign(to: \.isValid, on: contentView.loginButton)
//                .store(in: &bindings)
//
//            viewModel.statusTextField
//                .receive(on: RunLoop.main)
//                .assign(to: \.status, on: contentView.codeTextField)
//                .store(in: &bindings)
//
//            viewModel.isTimeLeft
//                .receive(on: RunLoop.main)
//                .assign(to: \.isValid, on: contentView.againButton)
//                .store(in: &bindings)
//
//            viewModel.counter
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: {
//                    switch $0 {
//                    case 0:
//                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз”"
//                    default:
//                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз” через \($0) секунды"
//                    }
//                } )
//                .store(in: &bindings)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc private func allCategoryButtonTapped() {
        let viewController = CategoryListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.categoryCollectionView {
            let category = indexPath.item
            let viewController = CategoryViewController(category: viewModel.categoryViewModels[category].category)
            navigationController?.pushViewController(viewController, animated: true)
        } else if collectionView == contentView.buyerChoiceCollectionView {
            let product = indexPath.item
            let viewController = ProductViewController(product: viewModel.buyerChoiceViewModels[product].product)
            navigationController?.pushViewController(viewController, animated: true)
        } else if collectionView == contentView.newProductCollectionView {
            let product = indexPath.item
            let viewController = ProductViewController(product: viewModel.newProductViewModels[product].product)
            navigationController?.pushViewController(viewController, animated: true)
        } else if collectionView == contentView.salesCollectionView {
            let product = indexPath.item
            let viewController = ProductViewController(product: viewModel.salesViewModels[product].product)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.shopCollectionView {
            return viewModel.shopViewModels.count
        } else if collectionView == contentView.categoryCollectionView {
            return viewModel.categoryViewModels.count
        } else if collectionView == contentView.buyerChoiceCollectionView {
            return viewModel.buyerChoiceViewModels.count
        } else if collectionView == contentView.newProductCollectionView {
            return viewModel.newProductViewModels.count
        } else if collectionView == contentView.salesCollectionView {
            return viewModel.salesViewModels.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.shopCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? ShopCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.shopViewModels[indexPath.item]
            return cell
        } else if collectionView == contentView.categoryCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? CategoryCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.categoryViewModels[indexPath.item]
            return cell
        } else if collectionView == contentView.buyerChoiceCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? ProductCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.buyerChoiceViewModels[indexPath.item]
            return cell
        } else if collectionView == contentView.newProductCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? ProductCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.newProductViewModels[indexPath.item]
            return cell
        }  else if collectionView == contentView.salesCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
            guard let cell = dequeuedCell as? ProductCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            cell.viewModel = viewModel.salesViewModels[indexPath.item]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contentView.shopCollectionView {
            return CGSize(width: Session.width - 32, height: 160)
        } else if collectionView == contentView.categoryCollectionView {
                return CGSize(width: 140, height: 144)
        } else if collectionView == contentView.buyerChoiceCollectionView || collectionView == contentView.newProductCollectionView || collectionView == contentView.salesCollectionView {
            return CGSize(width: 140, height: 204)
        } else {
            return CGSize(width: 126, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == contentView.shopCollectionView {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        } else {
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        }
    }
    
}

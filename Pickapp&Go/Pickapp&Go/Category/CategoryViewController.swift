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
        viewModel.category = category
        contentView.categoryLabel.text = category.title
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
        view.addTapGestureToHideKeyboard()
        setupCollectionsView()
        setUpTargets()
        viewModel.loadProduct()
//        setUpBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    override func viewDidLayoutSubviews() {
//        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
//            rect = rect.union(view.frame)
//        }
//        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
//    }
    
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
//        contentView.loginButton.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
//        contentView.againButton.addTarget(self, action: #selector(onClickAgain), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            bindViewToViewModel()
            bindViewModelToView()
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CategoryViewController: UICollectionViewDelegate { }

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
        if indexPath.item == 0 {
            return 316
        } else {
            return 204
        }
    }

    func width(forItemAt indexPath: IndexPath) -> CGFloat {
        return (Session.width - 48) / 2
    }
    
}

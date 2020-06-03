//
//  ProductViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class ProductViewController: UIViewController {
    private lazy var contentView = ProductView()
    private let viewModel: ProductViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: ProductViewModel = ProductViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: ProductViewModel = ProductViewModel(), product: Product) {
        self.init(viewModel: viewModel)
        viewModel.product = product
        loadData(product)
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
        setUpTargets()
        viewModel.load()
        setupCollectionsView()
//        setUpBindings()
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
    
    private func setupCollectionsView() {
        contentView.relatedCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        contentView.relatedCollectionView.dataSource = self
        contentView.relatedCollectionView.delegate = self
    }
    
    private func loadData(_ product: Product) {
//        let descriptionHeight = product.description.height(withConstrainedWidth: Session.width - 32, font: .lightSystemFontOfSize(size: 11))
//        contentView.descriptionHeight = descriptionHeight
//        contentView.descriptionHeightConstraint?.isActive = true
        let price = String(format: "%.0f", arguments: [product.price])
        let unit = " руб/\(product.unit)"
        
        let attributes = [NSAttributedString.Key.font: UIFont.lightSystemFontOfSize(size: 14)]
        let firstString = NSMutableAttributedString(string: price)
        let secondString = NSMutableAttributedString(string: unit, attributes: attributes)
        firstString.append(secondString)
        
        contentView.likeButton.isSelected = product.isFavorite
        contentView.productImage.image = UIImage(named: product.image)
        contentView.titleLabel.text = product.title
        contentView.subtitleLabel.text = product.subtitle
        contentView.priceLabel.attributedText = firstString
        contentView.proteinValueLabel.text = "3.2"
        contentView.fatsValueLabel.text = "0.5"
        contentView.carbohydratesValueLabel.text = "16.2"
        contentView.caloriesValueLabel.text = "62"
        contentView.descriptionValueLabel.text = product.description
        contentView.brandRow.rightLabel.text = "Zespri"
        contentView.originRow.rightLabel.text = "Чили"
        contentView.typeRow.rightLabel.text = "Веганский/постный продукт"
        contentView.tempRow.rightLabel.text = "+0.5С"
        contentView.conditionRow.rightLabel.text = "В холодильнике"
        contentView.categoryRow.rightLabel.text = product.subcategory.title
        contentView.relatedCollectionView.reloadData()
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        contentView.likeButton.addTarget(self, action: #selector(like), for: .touchUpInside)
        contentView.addToCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
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

//            viewModel.$productImage
//                .receive(on: RunLoop.main)
//                .assign(to: \.status, on: contentView.phoneTextField)
//                .sink(receiveValue: viewModelsValueHandler)
//                .store(in: &bindings)
//
//            bindViewToViewModel()
//            bindViewModelToView()
        }
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func like() {
        contentView.likeButton.isSelected = !contentView.likeButton.isSelected
        viewModel.product?.isFavorite = contentView.likeButton.isSelected
    }
    
    @objc private func addToCart() {
        guard let product = viewModel.product else { return }
        cartArray.append(CartItem(product: product, count: 1, price: product.price))
        totalItemsInCart += 1
        self.tabBarController?.increaseBadge(indexOfTab: 3, num: totalItemsInCart.description)
    }
    
}

extension ProductViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = indexPath.item
        let viewController = ProductViewController(product: viewModel.relatedProductsViewModels[product].product)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ProductViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.relatedProductsViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductCollectionViewCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.relatedProductsViewModels[indexPath.item]
        return cell
    }
    
}

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    
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

extension ProductViewController: ItemsInCartDelegate {
    
    func increaseBadge() {
        self.tabBarController?.increaseBadge(indexOfTab: 3, num: totalItemsInCart.description)
    }
    
}

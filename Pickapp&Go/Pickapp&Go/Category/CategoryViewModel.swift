//
//  CategoryViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class CategoryViewModel {

    var products: [Product] = []
    var filteredProducts: [Product] = []
    
    @Published var selectedSubcategory: [Category] = []
    @Published private(set) var subcategoryViewModels: [SubcategoryCellViewModel] = []
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    @Published private(set) var state: ListViewModelState = .loading
    private let categoriesService: CategoriesServiceProtocol
    private var bindings = Set<AnyCancellable>()
    
    init(categoriesService: CategoriesServiceProtocol = CategoriesService()) {
        self.categoriesService = categoriesService
    }
    
    func loadCategories(with parentCategoryId: String?) {
        state = .loading
        
        let searchTermCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error): self?.state = .error(error)
            case .finished: self?.state = .finishedLoading
            }
        }
        
        let searchTermValueHandler: ([Category]) -> Void = { [weak self] categories in
            self?.subcategoryViewModels = categories.map { SubcategoryCellViewModel(subcategory: $0) }
            
            self?.subcategoryViewModels.forEach {
                self?.loadProduct(categoryId: $0.subcategory.id)
            }
        }
        
        categoriesService
            .getSubcat(parentCategoryId: parentCategoryId)
            .sink(receiveCompletion: searchTermCompletionHandler, receiveValue: searchTermValueHandler)
            .store(in: &bindings)
    }
    
    
    func loadProduct(categoryId: String?) {
        guard let categoryId = categoryId else { return }
        state = .loading
        
        let searchTermCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error): self?.state = .error(error)
            case .finished: self?.state = .finishedLoading
            }
        }
        
        let searchTermValueHandler: ([Product]) -> Void = { [weak self] products in
            self?.productViewModels += products.map { ProductCellViewModel(product: $0) }
            self?.products += products.map { $0 }
        }
        
        categoriesService
            .getProducts(categoryId: categoryId)
            .sink(receiveCompletion: searchTermCompletionHandler, receiveValue: searchTermValueHandler)
            .store(in: &bindings)
    }
    
    func addSubcategory(_ index: Int) {
        let subcategory = subcategoryViewModels[index].subcategory
        selectedSubcategory.append(subcategory)
        filterBySubcategory()
    }
    
    func removeSubcategory(_ index: Int) {
        let subcategory = subcategoryViewModels[index].subcategory
        guard let removeIndex = selectedSubcategory.firstIndex(where: { $0.title == subcategory.title }) else { return }
        selectedSubcategory.remove(at: removeIndex)
        filterBySubcategory()
    }
    
    func filterBySubcategory() {
        filteredProducts.removeAll()
        productViewModels.removeAll()
        selectedSubcategory.forEach { subcategory in
            filteredProducts = products.filter { $0.categoryId == subcategory.id }
            filteredProducts.forEach {
                productViewModels.append(ProductCellViewModel(product: $0))
            }
        }
    }
    
    func noFilterCategory() {
        productViewModels.removeAll()
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }
    }
    
}

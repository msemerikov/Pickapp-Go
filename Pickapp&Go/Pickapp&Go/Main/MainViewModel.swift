//
//  MainViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

enum ListViewModelState {
    case loading
    case finishedLoading
    case error(Error)
}

final class MainViewModel {
    
    @Published var searchText: String = ""
    @Published private(set) var shopViewModels: [ShopCellViewModel] = [
        ShopCellViewModel(shop: victoriaShop)
    ]
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = []
    @Published private(set) var buyerChoiceViewModels: [ProductCellViewModel] = []
    @Published private(set) var newProductViewModels: [ProductCellViewModel] = []
    @Published private(set) var salesViewModels: [ProductCellViewModel] = []
    
    @Published private(set) var state: ListViewModelState = .loading
    private let categoriesService: CategoriesServiceProtocol
    private var bindings = Set<AnyCancellable>()
    
    init(categoriesService: CategoriesServiceProtocol = CategoriesService()) {
        self.categoriesService = categoriesService
        
        $searchText
            .sink { [weak self] in self?.loadCategories(with: $0) }
            .store(in: &bindings)
    }
    
    func loadCategories(with searchTerm: String?) {
        state = .loading
        
        let searchTermCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error): self?.state = .error(error)
            case .finished: self?.state = .finishedLoading
            }
        }
        
        let searchTermValueHandler: ([Category]) -> Void = { [weak self] categories in
            self?.categoryViewModels = categories.map { CategoryCellViewModel(category: $0) }
        }
        
        categoriesService
            .get()
            .sink(receiveCompletion: searchTermCompletionHandler, receiveValue: searchTermValueHandler)
            .store(in: &bindings)
    }
    
    func loadCategory() {
        categoriesArray.forEach {
            categoryViewModels.append(CategoryCellViewModel(category: $0))
        }
        
        buyerChoiceArray.forEach {
            buyerChoiceViewModels.append(ProductCellViewModel(product: $0))
        }
        
        newProductArray.forEach {
            newProductViewModels.append(ProductCellViewModel(product: $0))
        }
        
        salesProductArray.forEach {
            salesViewModels.append(ProductCellViewModel(product: $0))
        }
    }
    
}

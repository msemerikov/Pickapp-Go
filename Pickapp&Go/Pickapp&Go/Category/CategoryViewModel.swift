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

//    var category: Category?
    var category: String = ""
    var products: [Product] = []
    var subcategories: [Subcategory] = []
    
    @Published var selectedSubcategory: [Subcategory] = []
    @Published private(set) var subcategoryViewModels: [SubcategoryCellViewModel] = []
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    func loadProduct() {
        products.removeAll()
        productViewModels.removeAll()
        selectedSubcategory.removeAll()
        products = productsArray.filter { $0.category.title == category }
        
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }
        
        subcategories = subcategoriesArray.filter { $0.parent.title == category }
        subcategories.forEach {
            subcategoryViewModels.append(SubcategoryCellViewModel(subcategory: $0))
        }

    }
    
    func addSubcategory(_ index: Int) {
        let subcategory = subcategories[index]
        selectedSubcategory.append(subcategory)
        filterBySubcategory()
    }
    
    func removeSubcategory(_ index: Int) {
        let subcategory = subcategories[index]
        guard let removeIndex = selectedSubcategory.firstIndex(where: { $0.title == subcategory.title }) else { return }
        selectedSubcategory.remove(at: removeIndex)
        filterBySubcategory()
    }
    
    func filterBySubcategory() {
        products.removeAll()
        productViewModels.removeAll()
        selectedSubcategory.forEach { subcategory in
            products = productsArray.filter { $0.subcategory.title == subcategory.title }
            products.forEach {
                productViewModels.append(ProductCellViewModel(product: $0))
            }
        }
        
    }
    
}

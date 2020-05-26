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
    
    var category: Category?
    
    @Published private(set) var subcategoryViewModels: [SubcategoryCellViewModel] = [
//        ShopCellViewModel(shop: Shop(title: "ПЕРЕКРЕСТОК", image: "Shop1", address: "Долгопрудная, 74 ТРК “Облака”"))
    ]
    
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    func loadProduct() {
        var products: [Product] = []
        products = productsArray.filter { $0.category.title == category?.title }
        
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }
        
        var subcategories: [Subcategory] = []
        subcategories = subcategoriesArray.filter { $0.parent.title == category?.title }
        subcategories.forEach {
            subcategoryViewModels.append(SubcategoryCellViewModel(subcategory: $0))
        }

    }
    
}

//
//  ProductViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class ProductViewModel {

    var product: Product?
//    var products: [Product] = []
//    var subcategories: [Subcategory] = []
//    
//    @Published var productImage: String?
//    @Published var selectedSubcategory: [Subcategory] = []
//    @Published private(set) var subcategoryViewModels: [SubcategoryCellViewModel] = []
//    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    
    @Published private(set) var relatedProductsViewModels: [ProductCellViewModel] = []
    
    func load() {
        buyerChoiceArray.forEach {
            relatedProductsViewModels.append(ProductCellViewModel(product: $0))
        }
    }
    
}

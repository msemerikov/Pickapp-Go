//
//  MainViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class MainViewModel {
    
    @Published private(set) var shopViewModels: [ShopCellViewModel] = [
        ShopCellViewModel(shop: victoriaShop)
    ]
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = []
    @Published private(set) var buyerChoiceViewModels: [ProductCellViewModel] = []
    @Published private(set) var newProductViewModels: [ProductCellViewModel] = []
    @Published private(set) var salesViewModels: [ProductCellViewModel] = []
    
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

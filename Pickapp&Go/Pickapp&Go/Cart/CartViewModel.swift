//
//  CartViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class CartViewModel {

    var recommendedProducts: [Product] = []
    
    @Published private(set) var recommendedViewModels: [ProductCellViewModel] = []
    @Published private(set) var productInCartViewModels: [CartCellViewModel] = []
    @Published private(set) var totalValue: Double = 0
    
    func loadProduct() {
        totalValue = 0
        recommendedViewModels.removeAll()
        productInCartViewModels.removeAll()
//        recommendedProductArray.forEach {
//            recommendedViewModels.append(ProductCellViewModel(product: $0))
//        }
        
        cartArray.forEach {
            productInCartViewModels.append(CartCellViewModel(item: $0))
            totalValue += $0.amount
        }
    }
    
}

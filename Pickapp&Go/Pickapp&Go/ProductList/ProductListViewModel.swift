//
//  ProductListViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class ProductListViewModel {
    
    var products: [Product] = []
    
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    func loadProduct() {
        productViewModels.removeAll()
        
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }

    }
    
}

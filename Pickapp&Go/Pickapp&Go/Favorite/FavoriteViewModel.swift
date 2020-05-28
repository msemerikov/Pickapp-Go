//
//  FavoriteViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class FavoriteViewModel {

    var products: [Product] = []
    
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    func loadProduct() {
        products.removeAll()
        productViewModels.removeAll()
        products = productsArray.filter { $0.isFavorite }
        
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }

    }
    
}

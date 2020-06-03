//
//  OrderViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class OrderViewModel {

    var order: Order?
    @Published private(set) var productsViewModels: [CartCellViewModel] = []
    @Published private(set) var changedProductsViewModels: [CartCellViewModel] = []
    @Published private(set) var deletedProductsViewModels: [CartCellViewModel] = []
    @Published private(set) var totalValue: Double = 0
    
    func loadProduct() {
        
        order?.products.forEach {
            productsViewModels.append(CartCellViewModel(item: $0))
        }
        
        guard let total = order?.price else { return }
        totalValue = total
        
    }
    
}

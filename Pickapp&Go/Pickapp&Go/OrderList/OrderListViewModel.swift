//
//  OrderListViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class OrderListViewModel {

    @Published private(set) var ordersViewModels: [OrderCellViewModel] = []
    
    func loadProduct() {
        ordersViewModels.removeAll()
        
        ordersArray.forEach {
            ordersViewModels.append(OrderCellViewModel(order: $0))
        }
        
    }
    
}

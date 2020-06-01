//
//  OrderCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class OrderCellViewModel {
    
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
        //        self.description = description
        //        self.price = "\(price),00 руб."
        setUpBindings()
    }
    
    private func setUpBindings() {
        //        playerName = [player.firstName, player.lastName].joined(separator: " ")
        //        team = player.team.abbreviation
    }
    
}

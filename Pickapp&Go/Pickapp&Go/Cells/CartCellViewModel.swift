//
//  CartCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 28.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class CartCellViewModel {
    
    @Published var item: CartItem
    
    init(item: CartItem) {
        self.item = item
        //        self.description = description
        //        self.price = "\(price),00 руб."
        setUpBindings()
    }
    
    private func setUpBindings() {
        //        playerName = [player.firstName, player.lastName].joined(separator: " ")
        //        team = player.team.abbreviation
    }
    
}

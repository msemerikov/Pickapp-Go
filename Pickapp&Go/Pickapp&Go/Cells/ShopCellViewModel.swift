//
//  ShopCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 23.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class ShopCellViewModel {
    @Published var shop: Shop
    
    init(shop: Shop) {
        self.shop = shop
        setUpBindings()
    }
    
    private func setUpBindings() {
//        playerName = [player.firstName, player.lastName].joined(separator: " ")
//        team = player.team.abbreviation
    }
}

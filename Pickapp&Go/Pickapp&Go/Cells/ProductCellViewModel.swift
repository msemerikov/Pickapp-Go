//
//  ProductCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class ProductCellViewModel {
    
    @Published var product: Product
//    @Published var description: String = ""
//    @Published var price: String = ""
    
    init(product: Product) {
        self.product = product
//        self.description = description
//        self.price = "\(price),00 руб."
        setUpBindings()
    }
    
    private func setUpBindings() {
//        playerName = [player.firstName, player.lastName].joined(separator: " ")
//        team = player.team.abbreviation
    }
}

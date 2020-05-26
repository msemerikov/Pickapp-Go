//
//  SubcategoryCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class SubcategoryCellViewModel {
    @Published var subcategory: Subcategory
    
    init(subcategory: Subcategory) {
        self.subcategory = subcategory
        setUpBindings()
    }
    
    private func setUpBindings() {
//        playerName = [player.firstName, player.lastName].joined(separator: " ")
//        team = player.team.abbreviation
    }
}

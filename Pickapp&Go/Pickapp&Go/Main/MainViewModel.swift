//
//  MainViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class MainViewModel {
    
    @Published private(set) var eventsViewModels: [EventsCellViewModel] = [
        EventsCellViewModel(event: "Акция 1"),
        EventsCellViewModel(event: "Акция 2"),
        EventsCellViewModel(event: "Акция 3"),
        EventsCellViewModel(event: "Акция 4"),
        EventsCellViewModel(event: "Акция 5")
    ]
    
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = [
        CategoryCellViewModel(category: "Категория 1"),
        CategoryCellViewModel(category: "Категория 2"),
        CategoryCellViewModel(category: "Категория 3"),
        CategoryCellViewModel(category: "Категория 4"),
        CategoryCellViewModel(category: "Категория 5"),
        CategoryCellViewModel(category: "Категория 6"),
        CategoryCellViewModel(category: "Категория 7"),
        CategoryCellViewModel(category: "Категория 8"),
        CategoryCellViewModel(category: "Категория 9")
    ]
    
}

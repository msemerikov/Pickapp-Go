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
    
    @Published private(set) var shopViewModels: [ShopCellViewModel] = [
        ShopCellViewModel(shop: Shop(title: "ПЕРЕКРЕСТОК", image: "Shop1", address: "Долгопрудная, 74 ТРК “Облака”"))
    ]
    
    @Published private(set) var eventsViewModels: [EventsCellViewModel] = [
        EventsCellViewModel(event: Event(title: "Витаминный фейерверк!", image: "Event1")),
        EventsCellViewModel(event: Event(title: "Скидки NON-stop", image: "Event2")),
        EventsCellViewModel(event: Event(title: "Рыба. Море. Витамины!", image: "Event3")),
        EventsCellViewModel(event: Event(title: "Все, что нужно малышу", image: "Event4"))
    ]
    
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = []
    
    @Published private(set) var newsViewModels: [EventsCellViewModel] = [
        EventsCellViewModel(event: Event(title: "Новости", image: "News1")),
        EventsCellViewModel(event: Event(title: "Новости", image: "News2")),
        EventsCellViewModel(event: Event(title: "Новости", image: "News3"))
    ]
    
    @Published private(set) var buyerChoiceViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: blueberry),
        ProductCellViewModel(product: banana),
        ProductCellViewModel(product: cucumber),
        ProductCellViewModel(product: strawberry)
    ]
    
    @Published private(set) var newProductViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: apple),
        ProductCellViewModel(product: potato),
        ProductCellViewModel(product: peach)
    ]
    
    @Published private(set) var salesViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: cabbage),
        ProductCellViewModel(product: greenApple),
        ProductCellViewModel(product: cheese)
    ]
    
    func loadCategory() {
        categoriesArray.forEach {
            categoryViewModels.append(CategoryCellViewModel(category: $0))
        }
    }
    
}

//
//  ShopListViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

enum ListViewModelState {
    case loading
    case finishedLoading
    case error(Error)
}

final class ShopListViewModel {
    
    @Published private(set) var shopsViewModels: [ShopListCellViewModel] = [
        ShopListCellViewModel(shop: Shop(title: "Магнит", image: "Shop1", address: "")),
        ShopListCellViewModel(shop: Shop(title: "Окей", image: "Shop2", address: "")),
        ShopListCellViewModel(shop: Shop(title: "Лента", image: "Shop3", address: "")),
        ShopListCellViewModel(shop: Shop(title: "Карусель", image: "Shop4", address: "")),
        ShopListCellViewModel(shop: Shop(title: "Пятерочка", image: "Shop5", address: ""))
    ]

}

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
    
    @Published private(set) var shopsViewModels: [ListCellViewModel] = [
        ListCellViewModel(item: Shop(title: "Магнит", image: "Shop1", address: "")),
        ListCellViewModel(item: Shop(title: "Окей", image: "Shop2", address: "")),
        ListCellViewModel(item: Shop(title: "Лента", image: "Shop3", address: "")),
        ListCellViewModel(item: Shop(title: "Карусель", image: "Shop4", address: "")),
        ListCellViewModel(item: Shop(title: "Пятерочка", image: "Shop5", address: ""))
    ]

}

//
//  CategoryListViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class CategoryListViewModel {
    
    @Published private(set) var categoriesViewModels: [ListCellViewModel] = [
        ListCellViewModel(item: Category(title: "Мясо, птица, колбаса", image: "Category1")),
        ListCellViewModel(item: Category(title: "Фрукты и овощи", image: "Category2")),
        ListCellViewModel(item: Category(title: "Чай, кофе, какао", image: "Category3")),
        ListCellViewModel(item: Category(title: "Кондитерские изделия", image: "Category4")),
        ListCellViewModel(item: Category(title: "Бакалея", image: "Category5"))
    ]

}

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
        EventsCellViewModel(event: Event(title: "Витаминный фейерверк!", image: "Event1")),
        EventsCellViewModel(event: Event(title: "Скидки NON-stop", image: "Event2")),
        EventsCellViewModel(event: Event(title: "Рыба. Море. Витамины!", image: "Event3")),
        EventsCellViewModel(event: Event(title: "Все, что нужно малышу", image: "Event4"))
    ]
    
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = [
        CategoryCellViewModel(category: Category(title: "Мясо, птица, колбаса", image: "Category1")),
        CategoryCellViewModel(category: Category(title: "Фрукты и овощи", image: "Category2")),
        CategoryCellViewModel(category: Category(title: "Чай, кофе, какао", image: "Category3")),
        CategoryCellViewModel(category: Category(title: "Кондитерские изделия", image: "Category4")),
        CategoryCellViewModel(category: Category(title: "Бакалея", image: "Category5"))
    ]
    
    @Published private(set) var newsViewModels: [EventsCellViewModel] = [
        EventsCellViewModel(event: Event(title: "Новости", image: "News1")),
        EventsCellViewModel(event: Event(title: "Новости", image: "News2")),
        EventsCellViewModel(event: Event(title: "Новости", image: "News3"))
    ]
    
    @Published private(set) var buyerChoiceViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: Product(title: "Черешня красная", image: "Product1", description: "", price: 499)),
        ProductCellViewModel(product: Product(title: "Бананы", image: "Product2", description: "", price: 69.90)),
        ProductCellViewModel(product: Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99))
    ]
    
    @Published private(set) var newProductViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: Product(title: "Черешня красная", image: "Product1", description: "", price: 499)),
        ProductCellViewModel(product: Product(title: "Бананы", image: "Product2", description: "", price: 69.90)),
        ProductCellViewModel(product: Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99))
    ]
    
    @Published private(set) var salesViewModels: [ProductCellViewModel] = [
        ProductCellViewModel(product: Product(title: "Черешня красная", image: "Product1", description: "", price: 499)),
        ProductCellViewModel(product: Product(title: "Бананы", image: "Product2", description: "", price: 69.90)),
        ProductCellViewModel(product: Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99))
    ]
    
}

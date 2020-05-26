//
//  Product.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Product {
    var title: String
    var image: String
    var description: String
    var price: Double
    var unit: String
    var category: Category
}

let blueberry = Product(title: "Голубика «Artfruit»", image: "Product1", description: "", price: 216.00, unit: "200 г", category: vegetablesCat)
let banana = Product(title: "Бананы", image: "Product2", description: "", price: 69.90, unit: "1 кг", category: vegetablesCat)
let cucumber = Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "1 кг", category: vegetablesCat)
let strawberry = Product(title: "Земляника “Лучший выбор”", image: "Product11", description: "стандарт короткоплодный бугорчатый", price: 419.00, unit: "1 кг", category: vegetablesCat)
let apple = Product(title: "Яблоки", image: "Product4", description: "", price: 216.00, unit: "200 г", category: vegetablesCat)
let potato = Product(title: "Картофель", image: "Product5", description: "", price: 69.90, unit: "200 г", category: vegetablesCat)
let peach = Product(title: "Персики", image: "Product6", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: vegetablesCat)
let cabbage = Product(title: "Капуста", image: "Product7", description: "", price: 216.00, unit: "200 г", category: vegetablesCat)
let greenApple = Product(title: "Яблоки зеленые", image: "Product8", description: "", price: 69.90, unit: "200 г", category: vegetablesCat)
let cheese = Product(title: "Сыр", image: "Product9", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: milkCat)
let productsArray = [blueberry, banana, cucumber, strawberry, apple, potato, peach, cabbage, greenApple, cheese]

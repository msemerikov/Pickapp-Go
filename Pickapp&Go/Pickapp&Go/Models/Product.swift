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
    var subcategory: Subcategory
}

let blueberry = Product(title: "Голубика «Artfruit»", image: "Product1", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: berries)
let banana = Product(title: "Бананы", image: "Product2", description: "", price: 69.90, unit: "1 кг", category: vegetablesCat, subcategory: fruits)
let cucumber = Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "1 кг", category: vegetablesCat, subcategory: vegetables)
let strawberry = Product(title: "Земляника “Лучший выбор”", image: "Product11", description: "стандарт короткоплодный бугорчатый", price: 419.00, unit: "1 кг", category: vegetablesCat, subcategory: berries)
let apple = Product(title: "Яблоки", image: "Product4", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: fruits)
let potato = Product(title: "Картофель", image: "Product5", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: vegetables)
let peach = Product(title: "Персики", image: "Product6", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: vegetablesCat, subcategory: fruits)
let cabbage = Product(title: "Капуста", image: "Product7", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: vegetables)
let greenApple = Product(title: "Яблоки зеленые", image: "Product8", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: fruits)
let cheese = Product(title: "Сыр", image: "Product9", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: milkCat, subcategory: cheeses)
let kiwi = Product(title: "Киви золотое", image: "Product13", description: "Особый сорт киви отличается красивым золотистым оттенком сочной мякоти и более крупным размером. Всего в одном киви содержится дневная норма витамина С! Кроме того, этот фрукт богат витамином Е, магнием, фолиевой кислотой. Прекрасное лакомство, ингредиент для фруктовых салатов и десертов!", price: 217, unit: "кг", category: vegetablesCat, subcategory: fruits)

let productsArray = [blueberry, banana, cucumber, strawberry, apple, potato, peach, cabbage, greenApple, cheese]
let buyerChoiceArray = [kiwi, blueberry, banana, cucumber, strawberry]
let newProductArray = [apple, potato, peach]
let salesProductArray = [cabbage, greenApple, cheese]

//
//  Product.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

class Product {
    var title: String
    var image: String
    var description: String
    var price: Double
    var unit: String
    var category: Category
    var subcategory: Subcategory
    var isFavorite: Bool
    
    init(title: String, image: String, description: String, price: Double, unit: String, category: Category, subcategory: Subcategory, isFavorite: Bool) {
        self.title = title
        self.image = image
        self.description = description
        self.price = price
        self.unit = unit
        self.category = category
        self.subcategory = subcategory
        self.isFavorite = isFavorite
    }
}

var blueberry = Product(title: "Голубика «Artfruit»", image: "Product1", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: berries, isFavorite: false)
var banana = Product(title: "Бананы", image: "Product2", description: "", price: 69.90, unit: "1 кг", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cucumber = Product(title: "Огурец Зелёный", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "1 кг", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var strawberry = Product(title: "Земляника “Лучший выбор”", image: "Product11", description: "стандарт короткоплодный бугорчатый", price: 419.00, unit: "1 кг", category: vegetablesCat, subcategory: berries, isFavorite: false)
var apple = Product(title: "Яблоки", image: "Product4", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var potato = Product(title: "Картофель", image: "Product5", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var peach = Product(title: "Персики", image: "Product6", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cabbage = Product(title: "Капуста", image: "Product7", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var greenApple = Product(title: "Яблоки зеленые", image: "Product8", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cheese = Product(title: "Сыр", image: "Product9", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: milkCat, subcategory: cheeses, isFavorite: false)
var kiwi = Product(title: "Киви золотое", image: "Product13", description: "Особый сорт киви отличается красивым золотистым оттенком сочной мякоти и более крупным размером. Всего в одном киви содержится дневная норма витамина С! Кроме того, этот фрукт богат витамином Е, магнием, фолиевой кислотой. Прекрасное лакомство, ингредиент для фруктовых салатов и десертов!", price: 217, unit: "кг", category: vegetablesCat, subcategory: fruits, isFavorite: true)

let productsArray = [blueberry, banana, cucumber, strawberry, apple, potato, peach, cabbage, greenApple, cheese, kiwi]
let buyerChoiceArray = [kiwi, blueberry, banana, cucumber, strawberry]
let newProductArray = [apple, potato, peach]
let salesProductArray = [cabbage, greenApple, cheese]
let recommendedProductArray = [cabbage, greenApple, cheese, kiwi]
var cartArray = [cartItem1]

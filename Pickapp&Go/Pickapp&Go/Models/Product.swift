//
//  Product.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

class Product: Codable {
    var id: String?
    var categoryId: String?
    var brandId: String?
    var brandTitle: String?
    var title: String?
    var description: String?
    var ingredients: String?
    var characteristics: String?
    var url: String?
    var image: String?
    var price: String?
    var active: String?
}

extension Product {
    enum CodingKeys: String, CodingKey {
        case id
        case categoryId = "category_id"
        case brandId = "brand_id"
        case title
        case description
        case ingredients
        case characteristics
        case url
        case image = "img_name"
        case price
        case active
    }
}

struct ProductData {
    let goods: [Product]
}

extension ProductData: Decodable {
    private enum CodingKeys: String, CodingKey {
        case goods
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        goods = try container.decode([Product].self, forKey: .goods)
    }
}
/*
var blueberry = Product(title: "Голубика", subtitle: "«Artfruit»", image: "Product1", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: berries, isFavorite: false)
var banana = Product(title: "Бананы", subtitle: "Кавендиш", image: "Product2", description: "", price: 69.90, unit: "1 кг", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cucumber = Product(title: "Огурец", subtitle: "Зелёный богатырь", image: "Product3", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "1 кг", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var strawberry = Product(title: "Земляника", subtitle: "“Лучший выбор”", image: "Product11", description: "стандарт короткоплодный бугорчатый", price: 419.00, unit: "1 кг", category: vegetablesCat, subcategory: berries, isFavorite: false)
var apple = Product(title: "Яблоки", subtitle: "Красные", image: "Product4", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var potato = Product(title: "Картофель", subtitle: "Свежий урожай", image: "Product5", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var peach = Product(title: "Персики", subtitle: "Медовые", image: "Product6", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cabbage = Product(title: "Капуста", subtitle: "Свежий урожай", image: "Product7", description: "", price: 216.00, unit: "200 г", category: vegetablesCat, subcategory: vegetables, isFavorite: false)
var greenApple = Product(title: "Яблоки", subtitle: "Зеленые", image: "Product8", description: "", price: 69.90, unit: "200 г", category: vegetablesCat, subcategory: fruits, isFavorite: false)
var cheese = Product(title: "Сыр", subtitle: "Голландский", image: "Product9", description: "стандарт короткоплодный бугорчатый", price: 99, unit: "200 г", category: milkCat, subcategory: cheeses, isFavorite: false)
var kiwi = Product(title: "Киви", subtitle: "золотое", image: "Product13", description: "Особый сорт киви отличается красивым золотистым оттенком сочной мякоти и более крупным размером. Всего в одном киви содержится дневная норма витамина С! Кроме того, этот фрукт богат витамином Е, магнием, фолиевой кислотой. Прекрасное лакомство, ингредиент для фруктовых салатов и десертов!", price: 217, unit: "кг", category: vegetablesCat, subcategory: fruits, isFavorite: true)

let productsArray = [blueberry, banana, cucumber, strawberry, apple, potato, peach, cabbage, greenApple, cheese, kiwi]
let buyerChoiceArray = [kiwi, blueberry, banana, cucumber, strawberry]
let newProductArray = [apple, potato, peach]
let salesProductArray = [cabbage, greenApple, cheese]
let recommendedProductArray = [cabbage, greenApple, cheese, kiwi]
var cartArray: [CartItem] = []
*/
let productsArray: [Product] = []
let buyerChoiceArray: [Product] = []
let newProductArray: [Product] = []
let salesProductArray: [Product] = []
let recommendedProductArray: [Product] = []

var cartArray: [CartItem] = []
